import 'package:apptask/core/widgets/custom_text_feild.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back), title: Text(LocaleKeys.AddTask.tr())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(maximimLins:1,hintText: LocaleKeys.TaskTitel.tr()),
            CustomTextField(maximimLins: 5, hintText: LocaleKeys.Taskdescription.tr()),
            
          ],
        ),
      ),
    );
  }
}
