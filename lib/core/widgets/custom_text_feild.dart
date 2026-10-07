import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maximimLins;
  final void Function()? onTap;
  const CustomTextField({super.key, this.controller, required this.hintText,this.maximimLins, this.onTap });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        
        onTap: onTap,
        readOnly: onTap != null,
        maxLines:maximimLins ,
        controller: controller,
        onTapUpOutside: (v) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(112, 133, 133, 133),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
