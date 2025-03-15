// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:e_banking/screens/home_page.dart';
import 'package:e_banking/screens/splashscreen.dart'; // Importing the Material package.

void main() async {
  runApp(const EBanking());
}

// Root widget for the app.
class EBanking extends StatelessWidget {
  const EBanking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Banking',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/home': (context) => const HomePage(),
        // Add more routes as needed
      },
    );
  }
}