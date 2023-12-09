import 'package:bmi_flutter_project/constans.dart';
import 'package:flutter/material.dart';

class WeightGetter extends StatelessWidget {
  const WeightGetter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      height: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor)),
    );
  }
}
