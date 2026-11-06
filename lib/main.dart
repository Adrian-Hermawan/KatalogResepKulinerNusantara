import 'package:flutter/material.dart';
import 'screens/halaman_utama.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const KulinerNusantaraApp());
}

class KulinerNusantaraApp extends StatelessWidget {
  const KulinerNusantaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuliner Nusantara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF795548),
          primary: const Color(0xFF5D4037),
          secondary: const Color(0xFF8D6E63),
          surface: const Color(0xFFFFF8F0),
        ),
        // Pengaturan Font Kuliner
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
      ),
      home: const HomeScreen(),
    );
  }
}