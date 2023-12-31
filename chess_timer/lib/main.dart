import 'package:chess_timer/screens/home-screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chess Timer - Chess Clock',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        home: const HomeScreen());
  }
}
