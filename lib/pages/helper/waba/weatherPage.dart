import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:intl/intl.dart';
import 'package:wabayetu/resource/color.dart';
import 'package:weather/weather.dart';
import 'dart:ui';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {


  String location = "Nairobi";
  var tempText = "19";
  var weatherText = "Sunny";
  var weatherTextMore = "Sunny";


  var firstDate = "2022-12-13";
  var weatherTextFirst = "Sunny";
  var tempTextFirst = "19";

  var lastDate = "2022-12-13";
  var weatherTextLast = "Sunny";
  var tempTextLast = "19";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googlePlace = GooglePlace("AIzaSyAO6CcKrA0n1XTgIR6VHe-5G7P0p2KenGY");
    _jobControllerLocation.text = "Nairobi";
    moreHere();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: ListView(
        children: [
          inputLocation(),
          Column(
            children:  [
              const Icon(
                Icons.cloud,
                size: 24,
                color: ColorList.white,
              ),
              Text(
                location,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: ColorList.blue,
                    fontSize: 24),
              ),
              Text(
                "$tempText\u2103",
                style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    color: ColorList.blue,
                    fontSize: 34),
              ),
              Text(
                weatherText,
                style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    color: ColorList.blue,
                    fontSize: 17),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20,top:20),
            child: Text(
              "Weather Focus",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: ColorList.blue,
                  fontSize: 18),
            ),
          ),
          holderForecast(1,firstDate,tempTextFirst,weatherTextFirst),
          holderForecast(2, lastDate,tempTextLast,weatherTextLast),
          const SizedBox(height: 50,)
        ],
      ),
    );
  }

  bool _isSearchThere = false;

  Widget inputLocation() {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FocusScope(
              onFocusChange: (focus){
                // setState(() {
                //   _isSearchThere = focus;
                // });
              },
              child: TextField(
                cursorColor: ColorList.blue,
                onChanged: (value) {

                  setState(() {
                    _isSearchThere = true;
                  });
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                  } else {
                    if (predictions.isNotEmpty && mounted) {
                      setState(() {
                        predictions = [];
                      });
                    }
                  }
                },
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  color: ColorList.black,
                  fontSize: 14,
                ),
                controller: _jobControllerLocation,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ColorList.blue.withOpacity(.2),
                  hintText: 'Search Location',
                  suffixIcon: const Icon(
                    Icons.location_on,
                    size: 24,
                    color: ColorList.blue,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 1, color: ColorList.black.withOpacity(.0)),
                  ),
                  hintStyle: const TextStyle(
                      color: ColorList.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  labelStyle: const TextStyle(
                      color: ColorList.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorList.black.withOpacity(.0)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isSearchThere,
            child: Container(
              width: MediaQuery.of(context).size.width,
              constraints: const BoxConstraints(
                  minHeight: 1, maxHeight: 200),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: ColorList.blue,
                      child: Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(predictions[index].description!),
                    onTap: () async {
                      debugPrint(predictions[index].placeId);
                      _jobControllerLocation.text = predictions[index].description!;

                      FocusScope.of(context).requestFocus(FocusNode());

                      moreHere();

                      setState(() {
                        _isSearchThere = false;
                        location = _jobControllerLocation.text;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  final TextEditingController _jobControllerLocation = TextEditingController();


  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];



  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  List<Weather> _data = [];


  Widget text()  {
    return const Text("here");
  }

  Future<String> moreHere() async {
    double lat = 55.0111;
    double lon = 15.0569;
    String key = '075e226598427810b52883d500484af2';
    String cityName = 'Kongens Lyngby';
    WeatherFactory wf = WeatherFactory(key);




    Weather weather = await wf.currentWeatherByCityName(location.split(" ").elementAt(0));
    List<Weather> weatherWeek = await wf.fiveDayForecastByCityName(location.split(" ").elementAt(0));
    setState(() {
      _data = [weather];

      weatherText = weather.weatherDescription!;
      tempText = weather.temperature!.celsius!.round().toString();





       firstDate = weatherWeek.first.date.toString();
       weatherTextFirst = weatherWeek.first.weatherDescription!;
       tempTextFirst = weatherWeek.first.temperature!.celsius!.round().toString();

       lastDate = weatherWeek.last.date.toString();
       weatherTextLast = weatherWeek.last.weatherDescription!;
       tempTextLast = weatherWeek.last.temperature!.celsius!.round().toString();


      print(weatherWeek);
     // print(weather.temperature);
    });

   // print(_data);

    return weather.toString();
  }



  Widget holderForecast(int index, String getDate, String getTemp, String getWeather){
    Color back = ColorList.blue;
    Color backIcon = ColorList.white;
    if(index.floor().isEven){
      back = ColorList.white;
      backIcon = ColorList.blue;
    }else{
      back = ColorList.blue;
      backIcon = ColorList.white;
    }

    return Expanded(
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          decoration: BoxDecoration(
            color: ColorList.blue.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: back,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.cloud,
                    size: 24,
                    color: backIcon,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EE, d MMM').format( DateTime.parse(getDate)),
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: ColorList.blue,
                        fontSize: 12),
                  ),

                  Text(
                    getTemp,
                    style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        color: ColorList.blue,
                        fontSize: 12),
                  ),
                  Text(
                    getWeather,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorList.blue,
                        fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget userAdvertDetails(String image, String name, String about) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding:
        const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 30,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: ColorList.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            about,
                            maxLines: 6,
                            style: const TextStyle(
                              color: ColorList.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardList(int getIndex, String image, String name, String about) {
    return Container(
      height: 200 - (getIndex * 10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        //decoration for the outer wrapper
        color: ColorList.blue,
        borderRadius: BorderRadius.circular(30),
        //border radius exactly to ClipRRect
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 2, //spread radius
            blurRadius: 2, // blur radius
            offset: const Offset(0, 1), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: ClipRRect(
        //to clip overflown positioned containers.
        borderRadius: BorderRadius.circular(30),
        //if we set border radius on container, the overflown content get displayed at corner.
        child: Stack(
          children: <Widget>[
            //Stack helps to overlap widgets
            Positioned(
              //positioned helps to position widget wherever we want.
                top: -20,
                left: -50, //position of the widget
                child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                        color: ColorList.white
                            .withOpacity(0.5) //background color with opacity
                    ))),
            Positioned(
              //positioned helps to position widget wherever we want.
                top: -20,
                left: -50, //position of the widget
                child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorList.blue
                            .withOpacity(0.5) //background color with opacity
                    ))),

            Positioned(
                left: -80,
                top: -50,
                child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorList.blue.withOpacity(0.5)))),

            Positioned(
              //main content container postition.
              child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  child: userAdvertDetails(image, name, about)),
            )
          ],
        ),
      ),
    );
  }

}
