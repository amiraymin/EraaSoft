import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.person_rounded, color: Color.fromARGB(255, 6, 40, 231)),
            Text("create your profile"),
            Text("Add your name and profile picture"),
            TextFormField(
              onTapUpOutside: (v) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            Container(
              height: 30,
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
          ],
        ),
      ),
    );
  }
}
