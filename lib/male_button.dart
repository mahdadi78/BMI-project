import 'constans.dart';
import 'package:flutter/material.dart';

class MaleButton extends StatelessWidget {
  const MaleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: maleIsSelected ? activeOpacity : unActiveOpacity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/icons/male.png')),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: maleIsSelected
                    ? Colors.grey.shade800
                    : Colors.grey.shade300)),
        child: const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Male',
            style: TextStyle(color: Colors.black45),
          ),
        ),
      ),
    );
  }
}
