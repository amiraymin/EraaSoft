import 'package:apptask/core/models/task_model.dart';
import 'package:apptask/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TaskModel task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskColor = Color(task.color);

    return Scaffold(
      appBar: AppBar(title: Text('Task Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: taskColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    label: Text(task.status.tr()),
                    backgroundColor: taskColor,
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              LocaleKeys.Taskdescription.tr(),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              task.description.isEmpty ? '-' : task.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            _TaskInfoRow(
              icon: Icons.calendar_today_outlined,
              label: LocaleKeys.StartDate.tr(),
              value: task.date,
            ),
            const SizedBox(height: 12),
            _TaskInfoRow(
              icon: Icons.access_time,
              label: LocaleKeys.EndDate.tr(),
              value: task.time,
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _TaskInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
        Expanded(child: Text(value.isEmpty ? '-' : value)),
      ],
    );
  }
}
