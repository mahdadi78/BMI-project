import 'package:flutter/material.dart';

Color femaleColor = Colors.pink;
Color maleColor = Colors.orange;
Color borderColor = Colors.black38;
double activeOpacity = 1.0;
double unActiveOpacity = 0.5;

//if it changes The colors for men and women in UI will change
bool maleIsSelected = false;

//number picker height
int myHeight = 170;

//number picker weight
int myWeight = 60;

//age
int age = 22;

//bmi
String myBMI() {
  double metrHeight = myHeight / 100;
  double result = (myWeight / (metrHeight * metrHeight));
  return result.toStringAsFixed(1);
}

//checking bmi
String checkBMI(String bmi) {
  double bmiDouble = double.parse(bmi);
  String result = "";
  if (bmiDouble < 18.5) {
    result = "UnderWeight";
  } else if (bmiDouble >= 18.5 && bmiDouble < 24.9) {
    result = "Normal";
  } else if (bmiDouble > 25 && bmiDouble < 29.9) {
    result = "OverWeight";
  } else if (bmiDouble > 30.0 && bmiDouble < 34.9) {
    result = "Obesity Class I";
  } else if (bmiDouble > 35.0 && bmiDouble < 39.9) {
    result = "Obesity Class II";
  } else if (bmiDouble >= 40) {
    result = "Obesity Class III";
  }
  return result;
}
