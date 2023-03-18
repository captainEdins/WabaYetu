import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:wabayetu/pages/helper/waba/educate.dart';
import 'package:wabayetu/pages/helper/waba/faq.dart';
import 'package:wabayetu/pages/helper/waba/weatherPage.dart';
import 'package:wabayetu/pages/widgets/headers.dart';
import 'package:wabayetu/resource/color.dart';

class WabaPage extends StatefulWidget {
  const WabaPage({Key? key}) : super(key: key);

  @override
  State<WabaPage> createState() => _WabaPageState();
}

class _WabaPageState extends State<WabaPage> {

  var selectedButton = "Forecast";

  final controller = GroupButtonController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.selectIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body:   Column(
        children: [
          Headers(title: "Waba Page"),
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
            buttons: const ["Forecast", "FAQ", "Educate"],
          ),
          Expanded(child:  selectedButton == "Forecast" ? const WeatherPage() : selectedButton == "FAQ" ? const Faq() :  const Educate())
        ],
      ),
    );
  }
}
