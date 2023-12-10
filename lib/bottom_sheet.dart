import 'package:bmi_flutter_project/constans.dart';
import 'package:flutter/material.dart';

class BottomSheetmy extends StatefulWidget {
  const BottomSheetmy({
    super.key,
  });

  @override
  State<BottomSheetmy> createState() => _BottomSheetmyState();
}

class _BottomSheetmyState extends State<BottomSheetmy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 500,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Color(0xff2561c6),
      ),
      //-------------------------------------------body
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Your BMI is',
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          const SizedBox(height: 30),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '${myBMI(myHeight, myWeight, age)}   kg/m',
                  style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(2, -4),
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    //supers
                    //cript is usually smaller in size
                    textScaleFactor: 0.7,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
