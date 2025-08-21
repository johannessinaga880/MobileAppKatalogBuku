import 'package:flutter/material.dart';
import 'pages/app_shell.dart';

void main() {
  runApp(const KatalogBukuApp());
}

class KatalogBukuApp extends StatelessWidget {
  const KatalogBukuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Buku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: const Color(0xFF2196F3),
        scaffoldBackgroundColor: const Color(0xFFF6F7F9),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF2196F3),
          secondary: const Color(0xFF2196F3),
        ),
      ),
      home: const AppShell(),
    );
  }
}
