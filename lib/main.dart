import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/game_page.dart';
import 'package:tic_tac_toe/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.aclonicaTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        '/': (ctx) => const TictacToeHomePage(),
        '/gamePage': (ctx) =>  const GamePage(),
      },
    );
  }
}
