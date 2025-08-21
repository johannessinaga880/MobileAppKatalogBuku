import 'package:flutter/material.dart';
import '../data/mock_books.dart';
import '../models/book.dart';
import '../widgets/curved_header.dart';
import '../widgets/filter_chips.dart';
import '../widgets/book_card.dart';

class HomeTab extends StatefulWidget {
  final VoidCallback onMenuTap;
  const HomeTab({super.key, required this.onMenuTap});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  BookFilter _filter = BookFilter.all;

  List<Book> get _sortedAndFiltered {
    final sorted = [...mockBooks]..sort((a, b) =>
        priorityOrder(a.priority).compareTo(priorityOrder(b.priority)));
    if (_filter == BookFilter.all) return sorted;

    Priority? p;
    if (_filter == BookFilter.high) p = Priority.high;
    if (_filter == BookFilter.medium) p = Priority.medium;
    if (_filter == BookFilter.low) p = Priority.low;
    return sorted.where((e) => e.priority == p).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CurvedHeader(
          title: 'Katalog Buku',
          showMenu: true,
          onMenuTap: widget.onMenuTap,
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Halo, Johannes Sinaga',
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
        ),
        const SizedBox(height: 12),
        PriorityFilterChips(
          selected: _filter,
          onChanged: (f) => setState(() => _filter = f),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 24, top: 4),
            itemCount: _sortedAndFiltered.length,
            itemBuilder: (context, i) => BookCard(book: _sortedAndFiltered[i]),
          ),
        ),
      ],
    );
  }
}
