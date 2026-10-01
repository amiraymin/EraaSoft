import 'package:apptask/core/utils/app_constants.dart';
import 'package:apptask/features/home/home_screen.dart';
import 'package:apptask/features/login/data/user_model.dart';
import 'package:apptask/features/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),() {
     nextPage();
    });
    super.initState();
  }

  nextPage() {
    UserModel? user = Hive.box<UserModel>(AppConstants.userBoxName).get(AppConstants.CurrentUser);
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/icons/splash.json')),
    );
  }
}
