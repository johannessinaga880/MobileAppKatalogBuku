import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating; // 0..5 (mendukung 0.5 increments)
  final int count; // optional: jumlah ulasan/angka dibelakang
  const RatingStars({super.key, required this.rating, this.count = 0});

  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final hasHalf = (rating - full) >= 0.5;
    final empty = 5 - full - (hasHalf ? 1 : 0);

    List<Widget> stars = [];
    for (int i = 0; i < full; i++) {
      stars.add(const Icon(Icons.star, size: 18, color: Colors.amber));
    }
    if (hasHalf) {
      stars.add(const Icon(Icons.star_half, size: 18, color: Colors.amber));
    }
    for (int i = 0; i < empty; i++) {
      stars.add(const Icon(Icons.star_border, size: 18, color: Colors.amber));
    }

    if (count > 0) {
      stars.add(const SizedBox(width: 4));
      stars.add(Text('($count)',
          style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))));
    }

    return Row(children: stars);
  }
}
