import 'package:flutter/material.dart';
import '../data/mock_books.dart';
import '../models/book.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final total = mockBooks.length;
    final done = mockBooks.where((e) => e.status == ReadingStatus.done).length;
    final onGoing =
        mockBooks.where((e) => e.status == ReadingStatus.inProgress).length;
    final planned =
        mockBooks.where((e) => e.status == ReadingStatus.planned).length;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header profil
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: const [
                  CircleAvatar(radius: 18, child: Icon(Icons.person)),
                  SizedBox(width: 12),
                  Text(
                    'Johannes Sinaga',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Statistik
            _menuStatItem(Icons.collections_bookmark, '$total Koleksi buku'),
            _menuStatItem(Icons.check_circle, '$done Sudah Selesai'),
            _menuStatItem(Icons.autorenew, '$onGoing Sedang Dibaca'),
            _menuStatItem(Icons.flag_outlined, '$planned Akan Dibaca'),

            const Spacer(),

            // Tombol Back
            Padding(
              padding: const EdgeInsets.all(16),
              child: OutlinedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back'),
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _menuStatItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF6B7280)),
      title: Text(text, style: const TextStyle(color: Color(0xFF6B7280))),
      dense: true,
      visualDensity: const VisualDensity(vertical: -2),
    );
  }
}
