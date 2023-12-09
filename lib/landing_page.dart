import 'package:bmi_flutter_project/age_getter.dart';
import 'package:bmi_flutter_project/female_button.dart';
import 'package:bmi_flutter_project/male_button.dart';
import 'package:bmi_flutter_project/const_paint.dart';
import 'package:bmi_flutter_project/weight_getter.dart';
import 'package:flutter/material.dart';
import 'constans.dart';
import 'package:numberpicker/numberpicker.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              _sexualButtons(),
              numberPickerBox(context),
              //kg and age   selector
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [WeightGetter(), AgeGetter()],
                ),
              )
            ],
          ),
        ));
  }

  Padding _sexualButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              highlightColor: maleColor.withOpacity(.2),
              hoverColor: maleColor.withOpacity(.1),
              onTap: () {
                setState(() {
                  maleIsSelected = true;
                });
              },
              child: MaleButton()),
          InkWell(
              highlightColor: femaleColor.withOpacity(.2),
              hoverColor: femaleColor.withOpacity(.1),
              onTap: () {
                setState(() {
                  maleIsSelected = false;
                });
              },
              child: FemaleButton()),
        ],
      ),
    );
  }

  Text _title() {
    return const Text(
      'BMI Calculator',
      style: TextStyle(
          fontSize: 18, color: Colors.black54, fontWeight: FontWeight.w600),
    );
  }

  Widget numberPickerBox(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Height(in cm)',
                style: TextStyle(color: Colors.black54),
              ),

              //number picker
              numberPicker(),
              linePaint()
            ]),
      ),
    );
  }

  Widget numberPicker() {
    return Expanded(
      child: NumberPicker(
        itemCount: 3,
        selectedTextStyle: TextStyle(
            color: maleIsSelected ? maleColor : femaleColor,
            fontSize: 25,
            fontWeight: FontWeight.w700),
        axis: Axis.horizontal,
        value: myHeight,
        minValue: 100,
        maxValue: 220,
        step: 1,
        haptics: true,
        onChanged: (value) => setState(() => myHeight = value),
      ),
    );
  }
}
