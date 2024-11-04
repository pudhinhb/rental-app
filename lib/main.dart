import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(RentalApp());
}

class RentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental App',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      ),
      home: const HomeScreen(),
    );
  }
}