import 'package:flutter/material.dart';
import 'package:real_estate_task/pages/base/base_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate',
      theme: ThemeData(
        fontFamily: 'Euclid',
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xfffc9e12),
        ).copyWith(
          primary: const Color(0xfffc9e12),
          secondary: const Color(0xffa5957e),
          secondaryContainer: Colors.white,
          tertiary: const Color(0xff232220),
        ),
        useMaterial3: true,
      ),
      home: const BasePage(),
    );
  }
}
