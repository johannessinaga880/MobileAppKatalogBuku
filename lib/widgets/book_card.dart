import 'package:flutter/material.dart';
import '../models/book.dart';
import 'priority_tag.dart';
import 'rating_stars.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Stack(
        children: [
          // isi
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _leadingIcon(),
                const SizedBox(width: 14),
                Expanded(
                  child: _titleAuthorRating(theme),
                ),
                const SizedBox(width: 8),
                statusIcon(book.status),
              ],
            ),
          ),

          // tag prioritas di pojok kiri atas kartu
          Positioned(
            top: 10,
            left: 10,
            child: PriorityTag(priority: book.priority),
          ),
        ],
      ),
    );
  }

  Widget _leadingIcon() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(book.categoryIcon, size: 26, color: const Color(0xFF1E88E5)),
    );
  }

  Widget _titleAuthorRating(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(book.title, style: theme.textTheme.titleLarge),
        const SizedBox(height: 2),
        Text(book.author, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 8),
        RatingStars(rating: book.rating, count: book.rating.round()),
      ],
    );
  }
}
