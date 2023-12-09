import 'package:bmi_flutter_project/female_button.dart';
import 'package:bmi_flutter_project/male_button.dart';
import 'package:flutter/material.dart';
import 'constans.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  var _value = 160.0;

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
              _sliderBox(context),
            ],
          ),
        ));
  }

  Widget _sliderBox(BuildContext context) {
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
              Text(
                '$_value cm',
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black26,
                    fontSize: 30),
              ),
              //slider
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: maleIsSelected
                      ? maleColor.withOpacity(.9)
                      : femaleColor.withOpacity(.9),
                  inactiveTrackColor: maleIsSelected
                      ? maleColor.withOpacity(.2)
                      : femaleColor.withOpacity(.2),
                  trackShape: const RoundedRectSliderTrackShape(),
                  trackHeight: 30.0,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                  thumbColor: femaleColor,
                  overlayColor: Colors.transparent,
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: const RoundSliderTickMarkShape(),
                  activeTickMarkColor: maleIsSelected ? maleColor : femaleColor,
                  inactiveTickMarkColor: maleIsSelected
                      ? maleColor.withOpacity(.2)
                      : femaleColor.withOpacity(.2),
                  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: maleIsSelected ? maleColor : femaleColor,
                  valueIndicatorTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  value: _value,
                  min: 100,
                  max: 220,
                  divisions: 120,
                  label: '$_value cm',
                  onChanged: (value) {
                    setState(
                      () {
                        _value = value;
                      },
                    );
                  },
                ),
              ),
            ]),
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
