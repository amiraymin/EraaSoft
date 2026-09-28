import 'package:apptask/features/home/models/task_card_model.dart';
import 'package:apptask/features/home/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30.r,
                      ),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning 👋",
                          style: TextStyle(fontSize: (15.sp)),
                        ),
                        Text(
                          "Ahmed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Text("")),
                    Icon(Icons.notifications_none),
                  ],
                ),
                20.verticalSpace,
                Text(
                  "Today's Tasks",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                  
                ),
                15.verticalSpace,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      TaskCard(task: tasks[index]),
                  separatorBuilder: (context, index) => 20.verticalSpace,
                  itemCount: tasks.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<TaskCardModel> tasks = [
  TaskCardModel(
    title: "Flutter UI",
    details: "Build Register Screen",
    status: "Pending",
    barColor: const Color(0xff4C6FFF),
  ),
  TaskCardModel(
    title: "Workout",
    details: "Gym at 6 PM",
    status: "Done",
    barColor: const Color(0xff53B175),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: "In Progress",
    barColor: const Color(0xffF8A44C),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: "In Progress",
    barColor: const Color(0xffF8A44C),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: "In Progress",
    barColor: const Color(0xffF8A44C),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: "In Progress",
    barColor: const Color(0xffF8A44C),
  ),
    TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: "In Progress",
    barColor: const Color(0xffF8A44C),
  ),
    TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: "In Progress",
    barColor: const Color(0xffF8A44C),
  ),
];
