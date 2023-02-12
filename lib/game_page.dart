import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int oScore = 0;
  int xScore = 0;
  List displayChar = List.filled(9, '');
  bool xTurn = true;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('player O', style: TextStyle(color: Colors.white)),
                          const SizedBox(height: 10),
                          Text(oScore.toString(), style: const TextStyle(color: Colors.white, fontSize: 20))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('player X', style: TextStyle(color: Colors.white)),
                          const SizedBox(height: 10),
                          Text(xScore.toString(), style: const TextStyle(color: Colors.white, fontSize: 20))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Image.asset("assets/images/tictactoe.png", color: Colors.white70),
                  SizedBox(
                    height: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _createChar(index),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Center(
                              child:
                                  Text(displayChar[index], style: const TextStyle(fontSize: 16, color: Colors.white)),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () => _clear(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      color: Colors.white,
                      child: const Center(
                        child: Text('C L E A R', style: TextStyle(color: Colors.black, letterSpacing: 3)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createChar(index) {
    setState(() {
      if (xTurn && displayChar[index] == '') {
        displayChar[index] = 'x';
        xTurn = !xTurn;
        filledBoxes++;
      } else if (displayChar[index] == '') {
        displayChar[index] = 'o';
        xTurn = !xTurn;
        filledBoxes++;
      }
    });
    _checkWinner();
  }

  _clear() {
    setState(() {
      for (var i = 0; i < displayChar.length; i++) {
        displayChar[i] = '';
      }
    });
    filledBoxes = 0;
  }

  void _checkWinner() {
    if (displayChar[0] != '' && displayChar[0] == displayChar[1] && displayChar[0] == displayChar[2]) {
      _showWinDialog(displayChar[0]);
    } else if (displayChar[3] != '' && displayChar[3] == displayChar[4] && displayChar[3] == displayChar[5]) {
      _showWinDialog(displayChar[3]);
    } else if (displayChar[6] != '' && displayChar[6] == displayChar[7] && displayChar[6] == displayChar[8]) {
      _showWinDialog(displayChar[6]);
    } else if (displayChar[0] != '' && displayChar[0] == displayChar[3] && displayChar[0] == displayChar[6]) {
      _showWinDialog(displayChar[0]);
    } else if (displayChar[1] != '' && displayChar[1] == displayChar[4] && displayChar[1] == displayChar[7]) {
      _showWinDialog(displayChar[1]);
    } else if (displayChar[2] != '' && displayChar[2] == displayChar[5] && displayChar[2] == displayChar[8]) {
      _showWinDialog(displayChar[2]);
    } else if (displayChar[0] != '' && displayChar[0] == displayChar[4] && displayChar[0] == displayChar[8]) {
      _showWinDialog(displayChar[0]);
    } else if (displayChar[2] != '' && displayChar[2] == displayChar[4] && displayChar[2] == displayChar[6]) {
      _showWinDialog(displayChar[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    _showdialog('The winner is ${winner.toUpperCase()}', Colors.white);
    if (winner == 'o') {
      oScore++;
    } else {
      xScore++;
    }
  }

  void _showDrawDialog() => _showdialog('The winner is not found', Colors.red);

  static TextStyle alertTextStyle = const TextStyle(color: Colors.white, fontSize: 12);
  TextStyle alertAnswerStyle = alertTextStyle.copyWith(color: Colors.blue);

  void _showdialog(alert, alertColor) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade800,
        title: Text(
          alert,
          textAlign: TextAlign.center,
          style: alertTextStyle.copyWith(color: alertColor),
        ),
        content: Text(
          'Play again?',
          textAlign: TextAlign.center,
          style: alertTextStyle,
        ),
        contentPadding: const EdgeInsets.only(bottom: 0, top: 20),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () {
              _clear();
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text('No', style: alertAnswerStyle),
          ),
          TextButton(
            onPressed: () {
              _clear();
              Navigator.of(context).pop();
            },
            child: Text('Yes', style: alertAnswerStyle),
          )
        ],
      ),
    );
  }
}
