import 'package:flutter/material.dart';
import '../models/book.dart';

final List<Book> mockBooks = [
  const Book(
    title: 'Biologi',
    author: 'Johannes Sinaga',
    priority: Priority.high,
    status: ReadingStatus.done,
    rating: 5,
    categoryIcon: Icons.school,
  ),
  const Book(
    title: 'Kamus Bahasa Inggris',
    author: 'Johannes Sinaga',
    priority: Priority.high,
    status: ReadingStatus.inProgress,
    rating: 0,
    categoryIcon: Icons.menu_book,
  ),
  const Book(
    title: 'Komputasi Dasar',
    author: 'Johannes Sinaga',
    priority: Priority.medium,
    status: ReadingStatus.done,
    rating: 4,
    categoryIcon: Icons.computer,
  ),
  const Book(
    title: 'Cinderella',
    author: 'Johannes Sinaga',
    priority: Priority.low,
    status: ReadingStatus.inProgress,
    rating: 0,
    categoryIcon: Icons.auto_stories,
  ),
];
