import '../constans.dart';
import 'package:flutter/material.dart';

class FemaleButton extends StatelessWidget {
  const FemaleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: maleIsSelected ? unActiveOpacity : activeOpacity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/icons/female.png')),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: maleIsSelected ? borderColor : Colors.grey.shade800)),
        child: const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Female',
            style: TextStyle(color: Colors.black45),
          ),
        ),
      ),
    );
  }
}
