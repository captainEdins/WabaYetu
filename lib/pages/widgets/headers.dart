import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wabayetu/resource/color.dart';

class Headers extends StatefulWidget {
  String title;
  bool getBack;
   Headers({Key? key, required this.title , this.getBack = false}) : super(key: key);

  @override
  State<Headers> createState() => _HeadersState();
}

class _HeadersState extends State<Headers> {
  @override
  Widget build(BuildContext context) {
    return header(getTitle: widget.title);
  }

  Widget header({required String getTitle}) {
    return Container(
      padding: EdgeInsets.only(
          left: 10,
          top: MediaQuery.of(context).viewPadding.top > 0 ? 35 : 5,
          bottom: 5),
      width: double.infinity,
      child:  Row(
        children: [
          Visibility(
            visible: widget.getBack,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                child: const Icon(
                  CupertinoIcons.arrow_left_circle_fill,
                  color: ColorList.blue,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
              height: 60,
              width: 60,
              child: Image.asset("images/logo.png")),
          Text(
            getTitle,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: ColorList.blue,
            ),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
