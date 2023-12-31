import 'package:bmi_flutter_project/widgets/bottom_sheet.dart';
import 'package:bmi_flutter_project/widgets/female_button.dart';
import 'package:bmi_flutter_project/widgets/male_button.dart';
import 'package:bmi_flutter_project/widgets/const_paint.dart';
import 'package:flutter/material.dart';
import '../constans.dart';
import 'package:numberpicker/numberpicker.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomAppBar(
          //bottom navigation bar on scaffold
          color: Color(0xff2561c6),
          shape: CircularNotchedRectangle(), //shape of notch
        ),
        floatingActionButton: _floatingActionButton(),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(widthSize),
              _sexualButtons(),
              numberPickerBox(context),
              //kg and age   selector
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weightGetter(context),
                    //-----------------------------------------------age getter
                    ageGetter(context)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  SizedBox _floatingActionButton() {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
        backgroundColor: const Color(0xff0a0f29),
        onPressed: () {
          showModalBottomSheet(
            barrierColor: Colors.white.withOpacity(0),
            elevation: 0,
            clipBehavior: Clip.none,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const BottomSheetmy();
            },
          );
        },
        child: const Text(
          'BMI',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container ageGetter(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      height: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Text(
              'Age',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            //getter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _addAgeButton(),
                Text(
                  age.toString(),
                  style: TextStyle(
                      fontSize: 40,
                      color: maleIsSelected ? maleColor : femaleColor,
                      fontWeight: FontWeight.w500),
                ),
                _removeAgeButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  IconButton _removeAgeButton() {
    return IconButton(
        onPressed: () {
          if (age > 10) {
            setState(() {
              age--;
            });
          }
        },
        icon: const Icon(
          Icons.remove_circle_rounded,
          color: Colors.black26,
          size: 30,
        ));
  }

  IconButton _addAgeButton() {
    return IconButton(
        onPressed: () {
          if (age < 90) {
            setState(() {
              age++;
            });
          }
        },
        icon: const Icon(
          Icons.add_circle,
          color: Colors.black26,
          size: 30,
        ));
  }

  Container weightGetter(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      height: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Text(
              'Weight (in kg)',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 150,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(90)),
                  child: NumberPicker(
                    itemWidth: 52,
                    itemCount: 3,
                    selectedTextStyle: TextStyle(
                        color: maleIsSelected ? maleColor : femaleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    axis: Axis.horizontal,
                    value: myWeight,
                    minValue: 20,
                    maxValue: 200,
                    step: 1,
                    haptics: false,
                    onChanged: (value) {
                      setState(() {
                        myWeight = value;
                      });
                    },
                  ),
                ),
                const Positioned(
                    top: 0,
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.black,
                      size: 30,
                    )),
              ],
            ),
          ],
        ),
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

              // ignore: prefer_const_constructors
              child: MaleButton()),
          InkWell(
              highlightColor: femaleColor.withOpacity(.2),
              hoverColor: femaleColor.withOpacity(.1),
              onTap: () {
                setState(() {
                  maleIsSelected = false;
                });
              },
              // ignore: prefer_const_constructors
              child: FemaleButton()),
        ],
      ),
    );
  }

  Text _title(double width) {
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
        itemCount: 7,
        itemWidth: 49,
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
