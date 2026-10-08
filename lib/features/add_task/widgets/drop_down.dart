import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Status {
  pending,
  completed,
  inProgress,
}

class StatusDropDowen extends StatelessWidget {
  final void Function(String?) onChange;
  const StatusDropDowen({super.key  , required this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Status>(
      decoration: InputDecoration(
        fillColor: Colors.grey.shade300,
        filled: true,
        hintText: LocaleKeys.chooseStatus.tr(),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.r)
        ), // OutlineInputBorder
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.r)
        ), // OutlineInputBorder
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.r)
        ) // OutlineInputBorder
      ), // InputDecoration
      items: Status.values.map((status) =>
        DropdownMenuItem(value: status, child: Text(status.name.tr()))
      ).toList(),
      onChanged: (status) {
        onChange(status?.name);
      },
    ); // DropdownButtonFormField
  }
}