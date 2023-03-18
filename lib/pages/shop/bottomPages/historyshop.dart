import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wabayetu/pages/user/bottomPages/home/moreAboutShop.dart';
import 'package:wabayetu/pages/widgets/headers.dart';
import 'package:wabayetu/resource/color.dart';

class HistoryShop extends StatefulWidget {
  const HistoryShop({Key? key}) : super(key: key);

  @override
  State<HistoryShop> createState() => _HistoryShopState();
}

class _HistoryShopState extends State<HistoryShop> {

  @override
  void initState() {
    // TODO: implement initState
    setData();
    controller.selectIndex(0);
    super.initState();
  }


  var selectedButton = "History";

  final controller = GroupButtonController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: Column(
        children: [
          Headers(title: "History"),
          GroupButton(
            controller: controller,
            options: GroupButtonOptions(
              selectedShadow: const [],
              selectedTextStyle: const TextStyle(
                fontSize: 12,
                color: ColorList.white,
              ),
              selectedColor: ColorList.blue,
              unselectedShadow: const [],
              unselectedColor: ColorList.white,
              unselectedTextStyle: const TextStyle(
                fontSize: 12,
                color: ColorList.blue,
              ),
              selectedBorderColor: ColorList.blue,
              unselectedBorderColor: ColorList.blue,
              borderRadius: BorderRadius.circular(10),
              spacing: 10,
              runSpacing: 10,
              groupingType: GroupingType.wrap,
              direction: Axis.horizontal,
              buttonHeight: 35,
              buttonWidth: 70,
              mainGroupAlignment: MainGroupAlignment.center,
              crossGroupAlignment: CrossGroupAlignment.center,
              groupRunAlignment: GroupRunAlignment.center,
              textAlign: TextAlign.center,
              textPadding: EdgeInsets.zero,
              alignment: Alignment.center,
              elevation: 0,
            ),
            isRadio: true,
            onSelected: (button, index, isSelected) {
              print('$index button is selected');
              print('$button button is selected');

              setState(() {
                selectedButton = button;

              });
            },
            buttons: const ["History", "Customers"],
          ),
          Expanded(
              child: selectedButton == "History" ? StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('clicks')
                    .where("emailUser", isEqualTo: email)
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                    snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.dotsTriangle(
                        color: ColorList.blue,
                        size: 200,
                      ),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Column(
                      children: const [
                        Center(
                          child: Text(
                            "You currently having zero histroy search and be able to see them here",
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorList.blue,
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
                    itemBuilder: (ctx, index) => historyHolder(
                      snap: snapshot.data!.docs[index].data(),
                    ),
                  );
                },
              ) :
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('clicks')
                    .where("email", isEqualTo: email)
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                    snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.dotsTriangle(
                        color: ColorList.blue,
                        size: 200,
                      ),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Column(
                      children: const [
                        Center(
                          child: Text(
                            "You currently having zero histroy search and be able to see them here",
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorList.blue,
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
                    itemBuilder: (ctx, index) => customerHolder(
                      snap: snapshot.data!.docs[index].data(),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  Widget historyHolder({required Map<String, dynamic> snap}) {
    IconData iconData = Icons.account_circle;
    return InkWell(
      onTap: (){
        pushNewScreen(
          context,
          screen:  MoreAboutShop(data : snap),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.slideRight,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
          color: ColorList.blue.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorList.blue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  iconData,
                  size: 24,
                  color: ColorList.blue.withOpacity(.9),
                )),
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
      ),
    );
  }
  Widget customerHolder({required Map<String, dynamic> snap}) {
    IconData iconData = Icons.account_circle;
    return InkWell(
      onTap: (){
        pushNewScreen(
          context,
          screen:  MoreAboutShop(data : snap),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.slideRight,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
          color: ColorList.blue.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorList.blue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  iconData,
                  size: 24,
                  color: ColorList.blue.withOpacity(.9),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snap["full_name_user"],
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: ColorList.blue,
                        fontSize: 16),
                  ),
                  Text(
                    snap["emailUser"],
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorList.blue,
                        fontSize: 13),
                  ),
                  Text(
                    snap["phoneUser"],
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorList.blue,
                        fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
