import 'package:flutter/material.dart';

Container linePaint() {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
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
          decoration: const BoxDecoration(
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
    decoration: const BoxDecoration(
      color: Colors.black54,
    ),
  );
}
