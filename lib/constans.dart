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
String myBMI(int h, int w, int a) {
  double metrHeight = h / 100;
  double result = (w / (metrHeight * metrHeight));
  return result.toStringAsFixed(1);
}
