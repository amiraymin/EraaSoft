import 'dart:io';
import 'package:apptask/core/utils/app_constants.dart';
import 'package:apptask/core/widgets/custom_text_feild.dart';
import 'package:apptask/core/widgets/main_bottom.dart';
import 'package:apptask/features/home/home_screen.dart';
import 'package:apptask/features/login/data/user_model.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  // Creates a stateful screen because it needs to store the selected user image and update it.
   LoginScreen({
    super.key,
  }); // Creates the widget instance with a key used by Flutter internals.
  var fullNameController = TextEditingController(); // Controller for the text field where the user enters their full name.
  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Connects this widget to its mutable state class.
}

class _LoginScreenState extends State<LoginScreen> {
  XFile?
  profileImage; // Stores the selected profile image; null means no image has been picked yet.
  final picker =ImagePicker(); // Creates an image picker object to access the camera and gallery.

  Future<void> pickProfileImage(ImageSource source) async {
    // Opens the image picker for the given source and saves the chosen image.
    final selectedImage = await picker.pickImage(
      source: source,
    ); // Waits for the user to pick an image from the selected source.
    if (selectedImage == null || !mounted)
      return; // Stops if the user cancels or the widget is no longer active.
    setState(
      () => profileImage = selectedImage,
    ); // Updates the screen state with the picked image.
  }

  saveUserData(UserModel user) async {
    // Saves the user data to Hive for persistent storage.
    await Hive.box<UserModel>(AppConstants.userBoxName)
        .put(AppConstants.CurrentUser, user)
        .then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        })
        .catchError((error) {
          print('Error saving user data: $error');
        });
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
                    // Checks whether the app is currently using Arabic.
                    context.setLocale(
                      Locale('en'),
                    ); // Switches the app language to English.
                  } else {
                    context.setLocale(
                      Locale('ar'),
                    ); // Switches the app language to Arabic.
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
                              Navigator.pop(
                                context,
                              ); // Closes the bottom sheet before opening the camera.
                              pickProfileImage(
                                ImageSource.camera,
                              ); // Starts the camera picker and stores the captured image.
                            },
                          ),
                          MainBottom(
                            titel: "Gallary",
                            onTap: () {
                              // Runs when the user chooses the gallery option.
                              Navigator.pop(
                                context,
                              ); // Closes the bottom sheet before selecting from gallery.
                              pickProfileImage(
                                ImageSource.gallery,
                              ); // Starts the gallery picker and stores the selected image.
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
                  // Loads the selected image from its file path.
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
              CustomTextField(
                controller: widget.fullNameController,
                
                hintText: LocaleKeys.fullName.tr()),
              25.verticalSpace,
              InkWell(
                onTap: () {
                  saveUserData(
                    UserModel(
                      image: profileImage?.path??""
                     ,name: widget.fullNameController.text)); // Saves the user data to Hive and navigates to the home screen.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
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
