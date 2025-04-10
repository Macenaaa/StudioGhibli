import 'package:flutter/material.dart';
import 'package:studio_ghibli/screens/home_screens.dart';

void main() {
  runApp(const StudioGhibliapp());
}

class StudioGhibliapp extends StatelessWidget {
  const StudioGhibliapp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studio Ghibli',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
