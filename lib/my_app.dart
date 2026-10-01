import 'package:apptask/features/login/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget { // Defines the root widget of the app as a stateless widget.
  const MyApp({super.key}); // Creates the widget with a unique key, mainly used by Flutter internally.

  @override
  Widget build(BuildContext context) { // Builds the widget tree for the app.
    return ScreenUtilInit( // Wraps the app with ScreenUtil so sizes can adapt to device dimensions.
      // Screen Util code
      designSize: Size(375, 812), // Sets the base design size used to scale the UI
      minTextAdapt: true, // Enables text scaling adaptation for smaller devices.
      splitScreenMode: true, // Allows the app to support split-screen layouts.

      child: MaterialApp( // Creates the main Material app that contains the theme and navigator.
        debugShowCheckedModeBanner: false, // Hides the Flutter debug banner on the screen.

      // localization code
      // Provides the localization delegates required for translations.
      localizationsDelegates: context.localizationDelegates, 
      // Lists the locales the app supports, such as English and Arabic.
      supportedLocales: context.supportedLocales, 
      // Uses the current selected locale from the app context
      locale: context.locale, 

      // First Screen
      home: SplashScreen(), // Sets the splash screen as the first screen displayed when the app opens.
      ),
    );
  }
}
