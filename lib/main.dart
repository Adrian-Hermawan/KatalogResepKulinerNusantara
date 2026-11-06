import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
        colorSchemeSeed: Colors.deepOrange,
      ),
      home: const HomeScreen(),
    );
  }
}