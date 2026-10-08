import 'package:apptask/core/models/task_model.dart';
import 'package:apptask/core/utils/app_constants.dart';
import 'package:apptask/features/home/widgets/task_card.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  Future<void> _removeTask(dynamic taskKey) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.deleteTask.tr()),
        content: Text(LocaleKeys.confirmDeleteTask.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(LocaleKeys.deleteTask.tr()),
          ),
        ],
      ),
    );

    if (shouldDelete != true || !mounted) {
      return;
    }

    await Hive.box<TaskModel>(AppConstants.taskBoxName).delete(taskKey);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskBox = Hive.box<TaskModel>(AppConstants.taskBoxName);
    final taskKeys = taskBox.keys.toList();
    final tasks = taskBox.values.toList();
    return tasks.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => TaskCard(
              taskModeel: tasks[index],
              onDelete: () => _removeTask(taskKeys[index]),
            ),
            separatorBuilder: (context, index) => 20.verticalSpace,
            itemCount: tasks.length,
          )
        : Lottie.asset('assets/icons/no result found.json');
  }
}
