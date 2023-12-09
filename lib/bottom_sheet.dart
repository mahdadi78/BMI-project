import 'package:flutter/material.dart';

class BottomSheetmy extends StatefulWidget {
  const BottomSheetmy({
    super.key,
  });

  @override
  State<BottomSheetmy> createState() => _BottomSheetmyState();
}

class _BottomSheetmyState extends State<BottomSheetmy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Color(0xff2561c6),
      ),
      //-------------------------------------------body
    );
  }
}
