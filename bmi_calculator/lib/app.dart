import 'package:flutter/material.dart';

import 'screens/input_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: const Color(0xFF0E5895),
              titleSpacing: 5,
              titleTextStyle: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0E5895)),
        useMaterial3: true,
      ),
      home: const InputPage(),
    );
  }
}