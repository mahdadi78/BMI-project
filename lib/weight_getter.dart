import 'package:bmi_flutter_project/constans.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightGetter extends StatefulWidget {
  const WeightGetter({
    super.key,
  });

  @override
  State<WeightGetter> createState() => _WeightGetterState();
}

int weight = 60;

class _WeightGetterState extends State<WeightGetter> {
  @override
  Widget build(BuildContext context) {
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
                    value: weight,
                    minValue: 20,
                    maxValue: 200,
                    step: 1,
                    haptics: false,
                    onChanged: (value) {
                      setState(() {
                        weight = value;
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
}
