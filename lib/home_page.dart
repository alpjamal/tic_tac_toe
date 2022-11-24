// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TictacToeHomePage extends StatelessWidget {
  TictacToeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'TIC TAC TOE',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 120,
                child: Image.asset(
                  'lib/images/tictactoe.png',
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Text(
                      'Created by',
                      style: TextStyle(
                          fontSize: 10, color: Colors.white, letterSpacing: 3),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '@alp_jamal',
                      style: TextStyle(
                          fontSize: 15, color: Colors.white, letterSpacing: 3),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/gamePage'),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(30),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'PLAY GAME',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
