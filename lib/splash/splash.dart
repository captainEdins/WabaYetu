import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wabayetu/authetication/login.dart';
import 'package:wabayetu/pages/shop/shopHolder.dart';
import 'package:wabayetu/pages/user/userHolder.dart';
import 'package:wabayetu/resource/color.dart';
import 'package:wabayetu/splash/widgets/animationScreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('images/logo.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 4080), () async {
      openMe();
    });

    return Scaffold(
        backgroundColor: ColorList.white,
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height / 2) + 80,
                  width: (MediaQuery.of(context).size.width / 2) + 80,
                  child: Hero(tag: "logo", child: Image.asset("images/logo.png")),
                ),
              ),
            ),
            const IgnorePointer(
                child: AnimationScreen(
                    color: ColorList.blue
                )
            )
          ],
        ));
  }


  void openMe() async {
    final prefs = await SharedPreferences.getInstance();
    //check if the user have to set new password
    final getLoginStatus = prefs.getString('login') ?? "";
    final getRole = prefs.getString('role') ?? "";
    if(getLoginStatus == "in"){
      //here we are in home
      if(getRole == "Basic User"){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const UserHolder()));
      }else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ShopHolder()));
      }
    }else{
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  const Login()));
    }
    //check if the user have to set new password
  }
}
