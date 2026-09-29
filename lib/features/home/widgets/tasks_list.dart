
import 'package:apptask/features/home/models/task_card_model.dart';
import 'package:apptask/features/home/widgets/task_card.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => TaskCard(task: tasks[index]),
      separatorBuilder: (context, index) => 20.verticalSpace,
      itemCount: tasks.length,
    );
  }
}
List<TaskCardModel> tasks = [
  TaskCardModel(
    title: "Flutter UI",
    details: "Build Register Screen",
    status: LocaleKeys.pending,
    barColor: const Color(0xff4C6FFF),
  ),
  TaskCardModel(
    title: "Workout",
    details: "Gym at 6 PM",
    status: LocaleKeys.done,
    barColor: const Color(0xff53B175),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: LocaleKeys.in_progress,
    barColor: const Color(0xffF8A44C),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: LocaleKeys.in_progress,
    barColor: const Color(0xffF8A44C),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: LocaleKeys.in_progress,
    barColor: const Color(0xffF8A44C),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: LocaleKeys.in_progress,
    barColor: const Color(0xffF8A44C),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: LocaleKeys.in_progress,
    barColor: const Color(0xffF8A44C),
  ),
  TaskCardModel(
    title: "Meeting",
    details: "Team Sync",
    status: LocaleKeys.in_progress,
    barColor: const Color(0xffF8A44C),
  ),
];
