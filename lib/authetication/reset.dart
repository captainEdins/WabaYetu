import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wabayetu/dialog/dialogGood.dart';
import 'package:wabayetu/dialog/dialogLoadWait.dart';
import 'package:wabayetu/resource/color.dart';
import 'package:wabayetu/resource/string.dart';
import 'package:wabayetu/authetication/backend/authServices.dart';


class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top > 0 ? 40 : 10),
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: backButton())),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 4) - 5,
            width: (MediaQuery.of(context).size.width / 4) - 5,
            child: Padding( padding: const EdgeInsets.all(20),child: Hero(tag: "logo", child: Image.asset("images/logo.png", width: 40,))),
          ),
          const SizedBox(height: 40,),
          inputEmail(),
          buttonNext(),
          rememberUser()
        ],
      ),
    );
  }

  TextEditingController getEmail = TextEditingController();
  TextEditingController getPassword = TextEditingController();

  String get email => getEmail.text.trim();

  String get password => getPassword.text.trim();

  bool _obscured = true;
  final textFieldFocusNode = FocusNode();

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
      false; // Prevents focus if tap on eye
    });
  }

  Widget inputEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              cursorColor: ColorList.blue.withOpacity(.5),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                  color: ColorList.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              controller: getEmail,

              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: ColorList.blue.withOpacity(.2),
                hintText: 'Email',
                suffixIcon: const Icon(
                  Icons.email_outlined,
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
                      width: 1, color: ColorList.green.withOpacity(.0)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget rememberUser(){
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              Strings.rememberAccount,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: ColorList.black.withOpacity(.5), fontSize: 14),
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Text(
                Strings.backAccount,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: ColorList.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonNext() {
    return InkWell(
      onTap: () {
        if (email.isEmpty) {


          Fluttertoast.showToast(
              msg: "please do not leave any blanks",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM );
        } else {
          checkUser();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorList.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Reset password',
            style: TextStyle(
              color: ColorList.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }


  Future<void> checkUser() async {
    showAlertDialog(context);

    //check if the email exist
    final message = await AuthService()
        .reset(email: getEmail.text);


    Navigator.of(context, rootNavigator: true).pop();
    if (message!.contains('password reset was successfully')) {
      //open her the splashscreen
      takeMessage = 'Success!';
    } else {
      takeMessage = 'Error!';
    }

    showAlertDialogGood(message!,buttonOk(),takeMessage);

    //then load the user to the database
  }

  Widget backButton() {
    return const Icon(
      CupertinoIcons.arrow_left_square_fill,
      size: 34,
      color: ColorList.blue,
    );
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
}
