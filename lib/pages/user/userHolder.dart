import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wabayetu/pages/user/bottomPages/userHome.dart';
import 'package:wabayetu/resource/color.dart';

class UserHolder extends StatefulWidget {
  const UserHolder({Key? key}) : super(key: key);

  @override
  State<UserHolder> createState() => _UserHolderState();
}

class _UserHolderState extends State<UserHolder> {
  late PersistentTabController _controller;


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: ColorList.blue.withOpacity(.4), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0) ),
        colorBehindNavBar: ColorList.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.bounceInOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.bounceInOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house_fill),
        title: ("Home"),
        activeColorPrimary: ColorList.blue,
        inactiveColorPrimary: ColorList.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.square_list_fill),
        title: ("History"),
        activeColorPrimary: ColorList.blue,
        inactiveColorPrimary: ColorList.white,
      ), PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.drop_fill),
        title: ("Waba"),
        activeColorPrimary: ColorList.blue,
        inactiveColorPrimary: ColorList.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: ColorList.blue,
        inactiveColorPrimary: ColorList.white,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const UserHome(),
      containerHere("history"),
      containerHere("waba"),
      containerHere("settings"),
    ];
  }



  Widget containerHere(String textHere){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(20.0),
        ),
        Column(
          children:  <Widget>[
            Center(
              child: Text(textHere,
                  style: const TextStyle(
                    fontSize: 21,fontWeight: FontWeight.w900,color: ColorList.green,),textAlign: TextAlign.center
              ),
            ),
          ],
        ),
      ],
    );
  }

}