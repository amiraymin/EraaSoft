import 'package:apptask/core/models/task_model.dart';
import 'package:apptask/core/utils/app_constants.dart';
import 'package:apptask/features/login/data/user_model.dart';
import 'package:apptask/my_app.dart'; // Imports the app's root widget from the MyApp file.
import 'package:easy_localization/easy_localization.dart'; // Imports the localization package used for multi-language support.
import 'package:flutter/material.dart'; // Imports Flutter's Material UI components and app framework.
import 'package:hive_flutter/hive_flutter.dart'; // Imports Hive initialization for local storage.

void main() async {
  // The app starts here; async is needed because initialization work is asynchronous.
  WidgetsFlutterBinding.ensureInitialized(); // Makes sure Flutter's binding is ready before using platform services.
  /*
  Meaning of “binding” in Flutter
  In Flutter, a “binding” is the connection between the Flutter framework and the platform (Android/iOS/web).

  means:
  “Initialize the connection between Flutter and the native platform before we start using platform features.”

  Think of it like this:
  Flutter app = the app code
  platform = Android/iOS
  binding = the bridge that connects them
  */
  await EasyLocalization.ensureInitialized(); // Loads the localization settings before the app runs.*/
  await Hive.initFlutter(); // Initializes Hive for Flutter, allowing it to store data locally on the device.*/
  Hive.registerAdapter(TaskModelAdapter()); // Registers the TaskModel adapter so Hive knows how to store and retrieve TaskModel objects.
  Hive.registerAdapter(UserModelAdapter()); // Registers the UserModel adapter so Hive knows how to store and retrieve UserModel objects.
  await Hive.openBox<TaskModel>(AppConstants.taskBoxName); // Opens a Hive box named 'taskBox' for storing TaskModel instances.
  await Hive.openBox<UserModel>(AppConstants.userBoxName); // Opens a Hive box named 'userBox' for storing UserModel instances.
  runApp(
    EasyLocalization(
      // Wraps the app in the EasyLocalization widget so translations are available everywhere.
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
        ], // Allows the app to support English and Arabic languages.
      path:'assets/translations', // Points to the folder containing language JSON files.
      fallbackLocale: Locale('en',), // Uses English as the default language when a translation is missing.
      child: MyApp(), // Sets the app's main screen to the custom MyApp widget.
    ),
  );
}
