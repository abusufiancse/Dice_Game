import 'dart:math';

import 'package:flutter/material.dart';

class DiceGamePage extends StatefulWidget {
  const DiceGamePage({super.key});

  @override
  State<DiceGamePage> createState() => _DiceGamePageState();
}

class _DiceGamePageState extends State<DiceGamePage> {
  final random = Random.secure();
  final dicelist = [
    'lib/images/dice1.png',
    'lib/images/dice2.png',
    'lib/images/dice3.png',
    'lib/images/dice4.png',
    'lib/images/dice5.png',
    'lib/images/dice6.png',
  ];
  int index1 = 0;
  int index2 = 0;
  int diceSum = 0;
  String status = '';
  int point = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    dicelist[index1],
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    dicelist[index2],
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'The Two dice total point: $diceSum',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                status,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            if (point > 0)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'your target point is $point',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  index1 = random.nextInt(6);
                  index2 = random.nextInt(6);
                  diceSum = index1 + index2 + 2;
                  checkStatus();
                });
              },
              child: const Text('Roll the dice'),
            ),
            ElevatedButton(
              onPressed: reset,
              child: const Text('reset'),
            ),
          ],
        ),
      ),
    );
  }

  void checkStatus() {
    if (diceSum == 7 || diceSum == 11) {
      status = 'Player Wins';
    } else if (diceSum == 2 || diceSum == 3 || diceSum == 12) {
      status = 'Player Loss';
    } else {
      if (point == 0) {
        point = diceSum;
      }
    }
  }

  void reset() {
    setState(() {
      index1 = 0;
      index2 = 0;
      diceSum = 0;
      status = '';
    });
  }
}
