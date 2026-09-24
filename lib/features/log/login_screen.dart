import 'package:apptask/features/home/home_screen.dart';
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
              Icon(
                Icons.person_rounded,
                color: Color.fromARGB(255, 6, 40, 231),
                size: 100,
              ),
              Text("create your profile", style: TextStyle(fontSize: 19)),
              Text(
                "Add your name and profile picture",
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                width: 300.w,
                child: TextFormField(
                  onTapUpOutside: (v) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: InputBorder.none,
                    ),
                           
                ),
              ),
              25.verticalSpace,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                     MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                      ));
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
                      "Continue",
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
