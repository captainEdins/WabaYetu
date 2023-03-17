import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wabayetu/pages/user/bottomPages/home/moreAboutShop.dart';
import 'package:wabayetu/pages/widgets/headers.dart';
import 'package:wabayetu/resource/color.dart';

class HistoryUser extends StatefulWidget {
  const HistoryUser({Key? key}) : super(key: key);

  @override
  State<HistoryUser> createState() => _HistoryUserState();
}

class _HistoryUserState extends State<HistoryUser> {

  @override
  void initState() {
    // TODO: implement initState
    setData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: Column(
        children: [
          Headers(title: "History"),
          Expanded(
              child: StreamBuilder(
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
