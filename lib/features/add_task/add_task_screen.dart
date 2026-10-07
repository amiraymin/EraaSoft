import 'package:apptask/core/widgets/custom_text_feild.dart';
import 'package:apptask/core/widgets/main_bottom.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  List<Color> taskColors = [
    Color(0xff2196F3),
    Color(0xff4CAF50),
    Color.fromARGB(255, 255, 153, 0),
    Color(0xff9c27b0),
    Color(0xffF44336),
    Color(0xff009688),
  ];
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  var titelController = TextEditingController();
  var descriptionController = TextEditingController();
  var statusController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  int? selectedColorIndex; // Index of the selected color in the taskColors list

  @override
  void dispose() {
    titelController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
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
              controller: titelController,
              maximimLins: 1,
              hintText: LocaleKeys.TaskTitel.tr(),
            ),
            CustomTextField(
              controller: descriptionController,
              maximimLins: 5,
              hintText: LocaleKeys.Taskdescription.tr(),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: dateController,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2026),
                        lastDate: DateTime(2100),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          setState(() {
                            dateController.text = DateFormat.yMEd().format(
                              selectedDate,
                            );
                          });
                        }
                      });
                    },
                    hintText: LocaleKeys.StartDate.tr(),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: CustomTextField(
                    controller: timeController,
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        timeController.text = value?.format(context) ?? '';
                      });
                    },
                    hintText: LocaleKeys.EndDate.tr(),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Text(
              LocaleKeys.Status.tr(),
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            10.verticalSpace,
            DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(
                fillColor: const Color.fromARGB(112, 133, 133, 133),
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 10.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
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
            Text(
              LocaleKeys.ChoseColor.tr(),
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            10.verticalSpace,
            SizedBox(
              height: 50.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: taskColors.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedColorIndex = index; // Update the selected color index
                      });
                    },
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: taskColors[index],
                      child: selectedColorIndex == index
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                },
                separatorBuilder: (context, index) => 5.horizontalSpace,
              ),
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
