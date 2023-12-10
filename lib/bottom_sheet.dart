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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleText(),
          const SizedBox(height: 30),
          bmiText(),
          bmiCheckText(),
          descriptionText(),
        ],
      ),
    );
  }

  Padding descriptionText() {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text(
        'The BMI is a convenient rule of thumb used to broadly categorize a person as based on tissue mass (muscle, fat, and bone) and height. Major adult BMI classifications are underweight (under 18.5 kg/m2), normal weight (18.5 to 24.9), overweight (25 to 29.9), and obese (30 or more).[1] When used to predict an individuals health, rather than as a statistical measurement for groups, the BMI has limitations that can make it less useful than some of the alternatives, especially when applied to individuals with abdominal obesity, short stature, or high muscle mass.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white70,
        ),
      ),
    );
  }

  Padding bmiCheckText() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        '(${checkBMI(myBMI())})',
        style: TextStyle(fontSize: 15, color: Colors.white70),
      ),
    );
  }

  Text titleText() {
    return const Text(
      'Your BMI is',
      style: TextStyle(color: Colors.white60, fontSize: 15),
    );
  }

  RichText bmiText() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: '${myBMI()}   kg/m',
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
    );
  }
}
