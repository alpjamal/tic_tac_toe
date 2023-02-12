import 'package:flutter/material.dart';

import './constants.dart';

class TictacToeHomePage extends StatelessWidget {
  const TictacToeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 120),
                child: Text('TIC TAC TOE', style: kHomePageTitleTextStyle),
              ),
            ),
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 120,
                child: Image.asset('assets/images/tictactoe.png', color: Colors.white),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    const Text('Created by', style: kHomePageTextStyle),
                    const SizedBox(height: 12),
                    Text('@alp_jamal', style: kHomePageTextStyle.copyWith(fontSize: 15)),
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
                    padding: const EdgeInsets.all(30),
                    color: Colors.white,
                    child: const Center(
                      child: Text('PLAY GAME', style: TextStyle(color: Colors.black)),
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
