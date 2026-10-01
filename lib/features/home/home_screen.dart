import 'package:apptask/core/utils/app_constants.dart';
import 'package:apptask/features/add_task/add_task_screen.dart';
import 'package:apptask/features/home/widgets/task_container.dart';
import 'package:apptask/features/home/widgets/tasks_list.dart';
import 'package:apptask/features/home/widgets/welcome_row.dart';
import 'package:apptask/features/login/data/user_model.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getUserData() {
    UserModel? user = Hive.box<UserModel>(AppConstants.userBoxName).get(AppConstants.CurrentUser);
    return user; // Returns the current user data from the Hive box.
  }
  // This function is intended to retrieve user data, but it is currently empty.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        label: Row(children: [Icon(Icons.add), Text(LocaleKeys.Add.tr())]),
      ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeRow(),
                20.verticalSpace,
                TaskContainer(),
                20.verticalSpace,
                Text(
                  LocaleKeys.todaysTasks.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                15.verticalSpace,
                TasksList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
