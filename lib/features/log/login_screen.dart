import 'package:apptask/features/home/home_screen.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              Icon(
                Icons.person_rounded,
                color: Color.fromARGB(255, 6, 40, 231),
                size: 100,
              ),
              Text(LocaleKeys.createYourProfile.tr(), style: TextStyle(fontSize: 19)),
              Text(
                LocaleKeys.addYourNameAndProfilePicture.tr(),
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                width: 300.w,
                child: TextFormField(
                  onTapUpOutside: (v) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    labelText: LocaleKeys.fullName.tr(),
                    border: InputBorder.none,
                  ),
                ),
              ),
              25.verticalSpace,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 350,
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
