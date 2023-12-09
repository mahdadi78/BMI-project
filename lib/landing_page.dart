import 'package:bmi_flutter_project/female_button.dart';
import 'package:bmi_flutter_project/male_button.dart';
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
              _numberPickerBox(context),
            ],
          ),
        ));
  }

  Widget _numberPickerBox(BuildContext context) {
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

  Container linePaint() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          shortestLine(),
          shortestLine(),
          shortestLine(),
          shortestLine(),
          shortestLine(),
          shortestLine(),
          Container(
            width: 2,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          shortestLine(),
          shortestLine(),
          shortestLine(),
          shortestLine(),
          shortestLine(),
          shortestLine(),
        ],
      ),
    );
  }

  Container shortestLine() {
    return Container(
      width: 1,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black54,
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
}
