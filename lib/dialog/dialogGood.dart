
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../resource/color.dart';

class DialogGood extends StatelessWidget {
   String message;
   String title;
   Widget buttons;
   DialogGood({super.key,required this.message,required this.title,required this.buttons});


  @override
  Widget build(BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Container(
            constraints: const BoxConstraints(
                minHeight: 20, maxHeight: 350),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      ColorList.white,
                      ColorList.white,
                    ]
                ),
                borderRadius: BorderRadius.circular(40)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                   Icon(title == "Success!" ? Icons.gpp_good_rounded : title == "Error!" ? Icons.cancel_rounded : Icons.info_rounded,size: 100,color: title == "Success!" ? ColorList.green : title == "Error!" ? ColorList.red : ColorList.grey ),
                  const SizedBox(height: 3,),
                   Text(title,style:  TextStyle(
                    color: title == "Success!" ? ColorList.green : title == "Error!" ? ColorList.red : ColorList.grey,
                    fontWeight: FontWeight.w900,
                  ),),
                  const SizedBox(height: 3,),
                  Text(message,style: const TextStyle(
                    color: ColorList.grey,
                  ),),
                  const SizedBox(height: 10,),
                  buttons
                ],
              ),
            ),
          ),
        );
      }


    }
