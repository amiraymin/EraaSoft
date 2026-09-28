import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBottom extends StatelessWidget {
  final String titel;
  final void Function()? onTap;
  const MainBottom({super.key,required this.titel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: InkWell(
       onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.deepPurple.shade500,
          ),
          child: Text(
            titel,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
