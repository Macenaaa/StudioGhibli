import 'package:flutter/material.dart';
import 'screens/home_screens.dart';


void main() {
  runApp(const StudioGhibliapp());
}

class StudioGhibliapp extends StatelessWidget {
  const StudioGhibliapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
