import 'package:flutter/material.dart';
import '../models/book.dart';

class PriorityTag extends StatelessWidget {
  final Priority priority;
  const PriorityTag({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: priorityColor(priority),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        priorityText(priority),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
