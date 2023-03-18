import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';

import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wabayetu/authetication/backend/authServices.dart';
import 'package:wabayetu/dialog/dialogGood.dart';
import 'package:wabayetu/dialog/dialogLoadWait.dart';
import 'package:wabayetu/pages/user/bottomPages/home/moreAboutShop.dart';
import 'package:wabayetu/resource/color.dart';
import 'package:wabayetu/resource/utils.dart';


const double CAMERA_ZOOM = 5;
const double CAMERA_TILT = 10;
const double CAMERA_BEARING = 5;

class ShopHome extends StatefulWidget {
  const ShopHome({Key? key}) : super(key: key);

  @override
  State<ShopHome> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  Set<Marker> marker = {};
  String longitude = "";
  String latitude = "";
  String latitudeLongitudeSafe = "";

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  GoogleMapController? mapController;

  @override
  void initState() {
    // TODO: implement initState
    setData();
    super.initState();
  }

  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  CameraPosition initialCameraPosition = const CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(4.0383,21.7587)
  );


  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }



  Future<void> onMapCreated(
      GoogleMapController controllerGoogleMapCreated) async {
    controllerGoogleMapCreated.getVisibleRegion();


    Position position = await determinePosition();
    print(position.latitude);
    print(position.longitude);

    setState(() {


      mapController = controllerGoogleMapCreated;
      mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 10)
            //17 is new zoom level
          )
      );
    });

    _customInfoWindowController.googleMapController = controllerGoogleMapCreated;

    final Uint8List markIconsDoc = await getImages(images[0], 100);
    final Uint8List markIconsSeller = await getImages(images[1], 100);

    // doc.data()["role"] == "Water Treatment Facility" ? markerIconDoc :

    FirebaseFirestore.instance.collection("users")
        .where("role", isNotEqualTo: "Basic User")
        .snapshots()
        .listen((event) {

          if(event.docs.isNotEmpty){
            for (var doc in event.docs) {
              setState(()  {



                if(doc.data()["email"] != email){
                  marker.add(
                      Marker(
                        markerId: MarkerId(doc.data()["location"]),
                        draggable: false,
                        onTap: (){
                          _customInfoWindowController.addInfoWindow!(
                            Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorList.blue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            doc.data()["shopName"],
                                            style: const TextStyle(
                                              color: ColorList.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            doc.data()["bio"],
                                            maxLines: 4,
                                            style: const TextStyle(
                                              color: ColorList.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ColorList.white),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                createUser(doc.data());
                                              },
                                              child: const Text(
                                                'Continue',
                                                style: TextStyle(
                                                  color: ColorList.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Triangle.isosceles(
                                  edge: Edge.BOTTOM,
                                  child: Container(
                                    color: ColorList.blue,
                                    width: 20.0,
                                    height: 10.0,
                                  ),
                                ),
                              ],
                            ),
                            LatLng(double.parse(doc.data()["lat"].trim()),
                                double.parse(doc.data()["long"].trim())),
                          );
                        },

                        position: LatLng(double.parse(doc.data()["lat"].trim()),
                            double.parse(doc.data()["long"].trim())),
                        icon:  doc.data()["role"] == "Water Treatment Facility" ? BitmapDescriptor.fromBytes(markIconsDoc) : BitmapDescriptor.fromBytes(markIconsSeller),
                      ));
                }

              });
            }
          }

    });
  }






  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }

  List<String> images = ['images/doc.png','images/seller.png'];



  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      showSnackBar(context,'Location services are disabled.');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSnackBar(context,'Location permissions are denied');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      showSnackBar(context,
          'Location permissions are permanently denied, we cannot request permissions.');

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              GoogleMap(
                onTap: (position) {
                  _customInfoWindowController.hideInfoWindow!();
                },
                onCameraMove: (position) {
                  _customInfoWindowController.onCameraMove!();
                },
                onMapCreated: onMapCreated,
                markers: marker,
                initialCameraPosition: initialCameraPosition,),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: bottomAds())
            ],
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 180,
            width: 160,
            offset: 50,
          ),
        ],
      ),
    );
  }


  Widget bottomAds(){
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        decoration:  const BoxDecoration(
          color: ColorList.blue,
          borderRadius: BorderRadius.only(topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0) ),
        ),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('ads')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
            snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: ColorList.white,
                size: 100,
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Column(
              children: const [
                Center(
                  child: Text(
                    "You currently having zero adds search and be able to see them here",
                    maxLines: 1,
                    style: TextStyle(
                      color: ColorList.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => adsHolder(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }

  Widget adsHolder({required Map<String, dynamic> snap}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        color: ColorList.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                //decoration for the outer wrapper
                color: ColorList.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: CachedNetworkImage(
                imageUrl: snap['image'],
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snap["full_name"],
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 16),
                ),
                Text(
                  snap["bio"],
                  maxLines: 3,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> createUser(Map<String, dynamic> data) async {
    showAlertDialog(context);

    //check if the email exist


    var message = await AuthService().registrationClick(
      email: data["email"],
      name: data["full_name"],
      phone: data["phone"],
      role : data["role"],
      location : data["location"],
      bio : data["bio"],
      shopName : data["shopName"],
      nameUser: name,
      phoneUser: phone,
      emailUser: email,
    );




    Navigator.of(context, rootNavigator: true).pop();
    var messageNext = message;
    if (message!.contains('Success')) {
      //open her the splashscreen
      takeMessage = 'Success!';
      messageNext = "account was set up successfully";

      pushNewScreen(
        context,
        screen:  MoreAboutShop(data : data),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.slideRight,
      );

    } else {
      takeMessage = 'Error!';
      showAlertDialogGood(messageNext!,buttonOk(),takeMessage);
    }

  }



  showAlertDialog(BuildContext contexts) async {
    showDialog(
      context: contexts,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogLoadWait();
      },

    );
  }

  var takeMessage = '';
  Widget buttonOk() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              Navigator.pop(context);

              if (takeMessage == 'Success!') {
                //open her the splashscreen
                Navigator.pop(context);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: takeMessage == 'Success!' ? ColorList.green : ColorList.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'ok',
                style: TextStyle(
                  color: ColorList.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  showAlertDialogGood(String message, Widget buttonOk,String title) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogGood(message: message, title: title,buttons: buttonOk,);
      },
    );
  }


  Future<void> setData() async {
    final prefs = await SharedPreferences.getInstance();
    final getName = prefs.getString('name') ?? "";
    final getEmail = prefs.getString('email') ?? "";
    final getPhone = prefs.getString('phone') ?? "";






    setState(() {
      name = getName;
      email = getEmail;
      phone = getPhone;

    }
    );


  }

  var name = "";
  var email = "";
  var phone = "";


}



