import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maximimLins;
  const CustomTextField({super.key, this.controller, required this.hintText,this.maximimLins });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: TextFormField(
        maxLines:maximimLins ,
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
