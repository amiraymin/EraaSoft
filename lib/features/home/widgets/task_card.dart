import 'package:apptask/features/add_task/add_task_screen.dart';
import 'package:apptask/features/home/models/task_card_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final TaskCardModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // colored side bar
            Container(
              height: 85,
              width: 10,
              decoration: BoxDecoration(
                color: task.barColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 14),

            // title, subtitle, status pill
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff181725),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    task.details,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xff7C7C7C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: task.barColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      task.status.tr(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
              },
              child: Icon(Icons.chevron_right, color: Color(0xff7C7C7C)),
            ),
          ],
        ),
      ),
    );
  }
}
