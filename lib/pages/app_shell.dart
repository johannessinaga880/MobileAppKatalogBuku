import 'package:flutter/material.dart';
import '../models/book.dart';
import '../pages/home_tab.dart';
import '../pages/status_tab.dart';
import '../pages/menu_drawer.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _index = 0;

  void _openDrawer() => _scaffoldKey.currentState?.openDrawer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MenuDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 28),
      ),
      body: IndexedStack(
        index: _index,
        children: [
          HomeTab(onMenuTap: _openDrawer), // Tab 0
          const StatusTab(
            status: ReadingStatus.done,
            title: 'Sudah Selesai',
          ), // Tab 1
          const StatusTab(
            status: ReadingStatus.inProgress,
            title: 'Sedang Dibaca',
          ), // Tab 2
          const StatusTab(
            status: ReadingStatus.planned,
            title: 'Rencana / Plan',
          ), // Tab 3
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color(0xFF9CA3AF),
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.autorenew), label: 'On Going'),
          BottomNavigationBarItem(
              icon: Icon(Icons.flag_outlined), label: 'Plan'),
        ],
      ),
    );
  }
}
