import 'package:flutter/material.dart';
import 'package:furniture_app/pages/furniture_home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FurnitureHomePage()
    );
  }
}
