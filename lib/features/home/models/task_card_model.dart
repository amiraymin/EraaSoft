import 'dart:ui';

class TaskCardModel {
  final String title;
  final String details;
  final String status; // "Pending", "Done", "In Progress"
  final Color barColor;

  TaskCardModel({
    required this.title,
    required this.details,
    required this.status,
    required this.barColor,
  });
}