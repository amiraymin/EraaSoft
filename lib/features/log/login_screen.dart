import 'dart:io';

import 'package:apptask/core/widgets/custom_text_feild.dart';
import 'package:apptask/core/widgets/main_bottom.dart';

import 'package:apptask/features/home/home_screen.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  XFile? profileImage;
  final picker = ImagePicker();

  Future<void> pickProfileImage(ImageSource source) async {
    final selectedImage = await picker.pickImage(source: source);
    if (selectedImage == null || !mounted) return;
    setState(() => profileImage = selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (context.locale.languageCode == 'ar') {
                    context.setLocale(Locale('en'));
                  } else {
                    context.setLocale(Locale('ar'));
                  }
                },
                icon: Icon(Icons.language),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.all(16.0.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MainBottom(
                            titel: "Camera",
                            onTap: () {
                              Navigator.pop(context);
                              pickProfileImage(ImageSource.camera);
                            },
                          ),
                          MainBottom(
                            titel: "Gallary",
                            onTap: () {
                              Navigator.pop(context);
                              pickProfileImage(ImageSource.gallery);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.grey.shade400,
                    backgroundImage: profileImage != null
                      ? Image.file(File(profileImage!.path)).image
                      : null,
                    child: profileImage == null
                      ? Icon(
                          Icons.person_rounded,
                          color: Color.fromARGB(255, 6, 40, 231),
                          size: 75,
                        )
                      : null,
                ),
              ),
          
              20.verticalSpace,
              Text(
                LocaleKeys.createYourProfile.tr(),
                style: TextStyle(fontSize: 19),
              ),
              Text(
                LocaleKeys.addYourNameAndProfilePicture.tr(),
                style: TextStyle(fontSize: 19),
              ),
             CustomTextField(hintText: LocaleKeys.fullName.tr()),
              25.verticalSpace,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 153, 255),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.continuee.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
