import 'package:apptask/core/widgets/custom_text_feild.dart';
import 'package:apptask/core/widgets/main_bottom.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2070),
    );

    if (!mounted || selectedDate == null) return;
    _dateController.text =
        MaterialLocalizations.of(context).formatMediumDate(selectedDate);
  }

  Future<void> _selectTime() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (!mounted || selectedTime == null) return;
    _timeController.text =
        MaterialLocalizations.of(context).formatTimeOfDay(selectedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(LocaleKeys.AddTask.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              maximimLins: 1,
              hintText: LocaleKeys.TaskTitel.tr(),
            ),
            CustomTextField(
              maximimLins: 5,
              hintText: LocaleKeys.Taskdescription.tr(),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _dateController,
                    onTap: _selectDate,
                    hintText: LocaleKeys.StartDate.tr(),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: CustomTextField(
                    controller: _timeController,
                    onTap: _selectTime,
                    hintText: LocaleKeys.EndDate.tr(),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
             Text(LocaleKeys.Status.tr(), style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),
            10.verticalSpace,
            DropdownMenu(
              width: double.infinity,
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: LocaleKeys.in_progress.tr(),
                  label: LocaleKeys.in_progress.tr(),
                  style: ButtonStyle(foregroundColor: .all(Color(0xffF8A44C))),
                ),
                DropdownMenuEntry(
                  value: LocaleKeys.done.tr(),
                  label: LocaleKeys.done.tr(),
                  style: ButtonStyle(foregroundColor: .all(Colors.green)),
                ),
                DropdownMenuEntry(
                  value: LocaleKeys.pending.tr(),
                  label: LocaleKeys.pending.tr(),
                  style: ButtonStyle(foregroundColor: .all(Color(0xff4C6FFF))),
                ),
              ],
            ),
            20.verticalSpace,
            Text(LocaleKeys.ChoseColor.tr(), style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff2196F3),
                  radius: 20.r,
                ),
                8.horizontalSpace,
                   CircleAvatar(
                  backgroundColor: const Color(0xff4CAF50),
                  radius: 20.r,
                ),
                8.horizontalSpace,
                   CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 153, 0),
                  radius: 20.r,
                ),
                8.horizontalSpace,
                   CircleAvatar(
                  backgroundColor: const Color(0xff9c27b0),
                  radius: 20.r,
                ),
                8.horizontalSpace,
                   CircleAvatar(
                  backgroundColor: const Color(0xffF44336),
                  radius: 20.r,
                ),
                8.horizontalSpace,
                   CircleAvatar(
                  backgroundColor: const Color(0xff009688),
                  radius: 20.r,
                ),
               
                
              ],
            ),
            MainBottom(
              titel: LocaleKeys.SaveTask.tr(),
              onTap: () {
                // Handle the save task action here
              },
            ),
          ],
        ),
      ),
    );
  }
}
