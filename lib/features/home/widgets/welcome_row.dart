import 'dart:io';

import 'package:apptask/core/utils/app_constants.dart';
import 'package:apptask/features/login/data/user_model.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class WelcomeRow extends StatefulWidget {
  const WelcomeRow({super.key});

  @override
  State<WelcomeRow> createState() => _WelcomeRowState();
}

class _WelcomeRowState extends State<WelcomeRow> {
  @override
  Widget build(BuildContext context) {
       UserModel? user = Hive.box<UserModel>(AppConstants.userBoxName).get(AppConstants.CurrentUser);
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: Colors.blueAccent,
            backgroundImage: user?.image != null ? FileImage(File(user!.image!)) : null,
            child: user?.image == null ? Icon(Icons.person, color: Colors.white, size: 30.r) : null,
          ),
          20.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.GoodMorning.tr(), style: TextStyle(fontSize: (15.sp))),
                Text(
                  user?.name ?? "User", // Display the user's full name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.notifications_none),
        ],
      ),
    );
  }
}
