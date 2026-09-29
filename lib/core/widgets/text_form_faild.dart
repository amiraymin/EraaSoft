
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFaildLogin extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  const TextFormFaildLogin({super.key, this.controller,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: TextFormField(
        controller: controller,
        onTapUpOutside: (v) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          labelText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
