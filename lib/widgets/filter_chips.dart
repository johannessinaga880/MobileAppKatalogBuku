import 'package:flutter/material.dart';
import '../models/book.dart';

enum BookFilter { all, high, medium, low }

extension BookFilterX on BookFilter {
  String get label => switch (this) {
        BookFilter.all => 'Semua Buku',
        BookFilter.high => 'Tinggi',
        BookFilter.medium => 'Sedang',
        BookFilter.low => 'Rendah',
      };
}

class PriorityFilterChips extends StatelessWidget {
  final BookFilter selected;
  final ValueChanged<BookFilter> onChanged;
  const PriorityFilterChips({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final chips = BookFilter.values.map((f) {
      final bool isSelected = selected == f;
      return ChoiceChip(
        label: Text(f.label),
        selected: isSelected,
        onSelected: (_) => onChanged(f),
        selectedColor: const Color(0xFFE3F2FD),
        labelStyle: TextStyle(
          color: isSelected ? const Color(0xFF1E88E5) : const Color(0xFF6B7280),
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color:
                isSelected ? const Color(0xFF90CAF9) : const Color(0xFFE5E7EB),
          ),
        ),
        backgroundColor: Colors.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        for (int i = 0; i < chips.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          chips[i],
        ]
      ]),
    );
  }
}
