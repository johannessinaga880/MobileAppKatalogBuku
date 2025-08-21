import 'package:flutter/material.dart';

enum Priority { high, medium, low }

enum ReadingStatus { done, inProgress, planned }

class Book {
  final String title;
  final String author;
  final Priority priority;
  final ReadingStatus status;
  final double rating;
  final IconData categoryIcon;

  const Book({
    required this.title,
    required this.author,
    required this.priority,
    required this.status,
    required this.rating,
    this.categoryIcon = Icons.menu_book,
  });
}

String priorityText(Priority p) => p == Priority.high
    ? 'Tinggi'
    : p == Priority.medium
        ? 'Sedang'
        : 'Rendah';

Color priorityColor(Priority p) => p == Priority.high
    ? const Color(0xFFEF4444)
    : p == Priority.medium
        ? const Color(0xFFF59E0B)
        : const Color(0xFF10B981);

/// Ikon status: Done (hijau), OnGoing (kuning), Plan (biru)
Icon statusIcon(ReadingStatus s) => Icon(
      s == ReadingStatus.done
          ? Icons.check_circle
          : s == ReadingStatus.inProgress
              ? Icons.autorenew
              : Icons.flag,
      size: 24,
      color: s == ReadingStatus.done
          ? const Color(0xFF10B981)
          : s == ReadingStatus.inProgress
              ? const Color(0xFFF59E0B)
              : const Color(0xFF1E88E5),
    );

int priorityOrder(Priority p) => p == Priority.high
    ? 0
    : p == Priority.medium
        ? 1
        : 2;
