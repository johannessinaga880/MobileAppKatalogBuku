import 'package:flutter/material.dart';
import '../data/mock_books.dart';
import '../models/book.dart';
import '../widgets/curved_header.dart';
import '../widgets/book_card.dart';

class StatusTab extends StatelessWidget {
  final ReadingStatus status;
  final String title;

  const StatusTab({
    super.key,
    required this.status,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final items = mockBooks.where((b) => b.status == status).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CurvedHeader(title: title),
        Expanded(
          child: items.isEmpty
              ? const Center(
                  child: Text('Belum ada data.'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  itemCount: items.length,
                  itemBuilder: (c, i) => BookCard(book: items[i]),
                ),
        ),
      ],
    );
  }
}
