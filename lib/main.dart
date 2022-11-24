// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/game_page.dart';
import 'package:tic_tac_toe/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.aclonicaTextTheme()),
      themeMode: ThemeMode.dark,
      routes: {
        '/': (context) => TictacToeHomePage(),
        '/gamePage': (context) => GamePage(),
      },
    );
  }
}
