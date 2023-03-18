import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wabayetu/resource/color.dart';
import 'package:wabayetu/resource/string.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  bool bool1 = false;
  bool bool2 = false;
  bool bool3 = false;
  bool bool4 = false;
  bool bool5 = false;
  bool bool6 = false;
  bool bool7 = false;
  bool bool8 = false;
  bool bool9 = false;
  bool bool10 = false;
  bool bool11 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          itemFaq1(
              title: 'Is a ${Strings.appName} vending app?',
              about:
                  '${Strings.appName} is a vending mobile application that allows users to purchase and pay for purified water from vending machines using their smartphones. And also gain access to important information using the the App.',
              mainBool: bool1),
          itemFaq2(
              title: 'How does the app work?',
              about:
                  'Users can download the app, register their details, and locate the nearest vending machine on the map. They can then select the amount of water they want to purchase and pay for it through the app. Once the payment is confirmed, the vending machine dispenses the purified water.',
              mainBool: bool2),
          itemFaq3(
              title:
                  'What requirements do I need to be user of ${Strings.appName}? ',
              about:
                  'The Main requirement needed to use ${Strings.appName}.\n1.Must Have ${Strings.appName} App with.\n2.Registered Member',
              mainBool: bool3),
          itemFaq4(
              title: 'Is the water safe to drink?',
              about:
                  'Yes, the water provided by the vending machines is purified and safe to drink.',
              mainBool: bool4),
          itemFaq5(
              title: 'Can I refill my own water bottle?',
              about:
                  'Yes, users can refill their own water bottles at the vending machine by selecting the "refill" option in the app.',
              mainBool: bool5),
          itemFaq6(
              title: 'What payment options are available?',
              about:
                  'Once connected to a particular kiosk, payment method varies from kiosk to kiosk',
              mainBool: bool6),
          itemFaq7(
              title: 'How much does the water cost?',
              about:
                  'The cost of water may vary depending on the location and the amount of water purchased. The app will display the cost of water before the user confirms the purchase.',
              mainBool: bool7),
          itemFaq8(
              title: 'Is there a minimum purchase amount?',
              about:
                  'The minimum purchase amount may vary depending on the vending machine. The app will display the minimum purchase amount before the user',
              mainBool: bool8),
          itemFaq9(
              title: 'Is the water from vending machines safe to drink?',
              about: 'Yes, the water from the vending machines is safe',
              mainBool: bool9),
          itemFaq10(
              title: 'Should I trust ${Strings.appName}?',
              about:
                  '${Strings.appName} is 100% trustworthy, water from the vendors are 100% clean and verified by Kenya Water Authorities.',
              mainBool: bool10),
          itemFaq11(
              title: 'How can I get new water connection?',
              about:
                  'The customer fills in an online application through our portal',
              mainBool: bool11),
        ],
      ),
    );
  }

  Widget itemFaq1(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool1);
                  setState(() {
                    if (bool1 == false) {
                      setState(() {
                        bool1 = true;
                      });
                    } else {
                      setState(() {
                        bool1 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool1 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool1,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq2(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool2);
                  setState(() {
                    if (bool2 == false) {
                      setState(() {
                        bool2 = true;
                      });
                    } else {
                      setState(() {
                        bool2 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool2 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool2,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq3(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool3);
                  setState(() {
                    if (bool3 == false) {
                      setState(() {
                        bool3 = true;
                      });
                    } else {
                      setState(() {
                        bool3 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool3 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool3,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq4(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool4);
                  setState(() {
                    if (bool4 == false) {
                      setState(() {
                        bool4 = true;
                      });
                    } else {
                      setState(() {
                        bool4 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool4 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool4,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq5(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool5);
                  setState(() {
                    if (bool5 == false) {
                      setState(() {
                        bool5 = true;
                      });
                    } else {
                      setState(() {
                        bool5 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool5 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool5,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq6(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool6);
                  setState(() {
                    if (bool6 == false) {
                      setState(() {
                        bool6 = true;
                      });
                    } else {
                      setState(() {
                        bool6 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool6 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool6,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq7(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool7);
                  setState(() {
                    if (bool7 == false) {
                      setState(() {
                        bool7 = true;
                      });
                    } else {
                      setState(() {
                        bool7 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool7 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool7,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq8(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool8);
                  setState(() {
                    if (bool8 == false) {
                      setState(() {
                        bool8 = true;
                      });
                    } else {
                      setState(() {
                        bool8 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool8 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool8,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq9(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool9);
                  setState(() {
                    if (bool9 == false) {
                      setState(() {
                        bool9 = true;
                      });
                    } else {
                      setState(() {
                        bool9 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool9 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool9,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq10(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool10);
                  setState(() {
                    if (bool10 == false) {
                      setState(() {
                        bool10 = true;
                      });
                    } else {
                      setState(() {
                        bool10 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool10 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool10,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq11(
      {required String title, required String about, required bool mainBool}) {
    return Container(
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool11);
                  setState(() {
                    if (bool11 == false) {
                      setState(() {
                        bool11 = true;
                      });
                    } else {
                      setState(() {
                        bool11 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool11 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool11,
            child: Text(
              about,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: ColorList.blue,
                  fontSize: 8),
            ),
          )
        ],
      ),
    );
  }
}
