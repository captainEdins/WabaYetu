import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wabayetu/authetication/backend/authServices.dart';
import 'package:wabayetu/authetication/register.dart';
import 'package:wabayetu/authetication/reset.dart';
import 'package:wabayetu/dialog/dialogGood.dart';
import 'package:wabayetu/dialog/dialogLoadWait.dart';
import 'package:wabayetu/resource/color.dart';
import 'package:wabayetu/resource/string.dart';
import 'package:wabayetu/splash/splash.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 4;
    return Scaffold(
      backgroundColor: ColorList.white,
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top > 0 ? 40 : 10),
        children: <Widget>[
          SizedBox(
            height: (MediaQuery.of(context).size.height / 4) - 5,
            width: (MediaQuery.of(context).size.width / 4) - 5,
            child: Padding( padding: const EdgeInsets.all(20),child: Hero(tag: "logo", child: Image.asset("images/logo.png", width: 40,))),
          ),
          const SizedBox(height: 40,),
          inputEmail(),
          inputPassword(),
          forgotPassword(),
          buttonNext(),
          registerUser()
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
                      width: 1, color: ColorList.black.withOpacity(.0)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              obscureText: _obscured,
              focusNode: textFieldFocusNode,
              keyboardType: TextInputType.text,
              cursorColor: ColorList.blue.withOpacity(.5),
              style: const TextStyle(
                  color: ColorList.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              controller: getPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: ColorList.blue.withOpacity(.2),
                hintText: 'Password',
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: GestureDetector(
                    onTap: _toggleObscured,
                    child: Icon(
                      _obscured
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 24,
                      color: ColorList.blue,
                    ),
                  ),
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
        ],
      ),
    );
  }

  Widget forgotPassword(){
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 20,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Reset()));
            },
            child: Text(
              Strings.forgotPassword.toLowerCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: ColorList.black, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
  Widget registerUser(){
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              Strings.noAccount,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: ColorList.black.withOpacity(.5), fontSize: 14),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
              },
              child: const Text(
                Strings.registerNow,
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
        if (getEmail.text.isEmpty ||
            getPassword.text.isEmpty) {

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
            'Sign in',
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
        .login(email: getEmail.text, password: getPassword.text);


    // Fluttertoast.showToast(
    //     msg: message!,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM );

    Navigator.of(context, rootNavigator: true).pop();
    var textMessage = message;
    if (message!.contains('welcome')) {
      //open her the splashscreen
      takeMessage = 'Success!';
      textMessage = 'Welcome';
    } else {
      takeMessage = 'Error!';
    }




    showAlertDialogGood(textMessage!,buttonOk(),takeMessage);

    //then load the user to the database
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
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const Splash()));
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

  showAlertDialog(BuildContext contexts) async {
    showDialog(
      context: contexts,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogLoadWait();
      },
    );
  }


}
