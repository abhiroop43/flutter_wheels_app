import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wheels_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheels: Vehicle Cataloging',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 131, 57, 0)),
        textTheme: GoogleFonts.exo2TextTheme(),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
