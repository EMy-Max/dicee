import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Dice());
}

class Dice extends StatelessWidget {
  const Dice({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Dicee'),
      ),
      body: const DiceBody(),
    );
  }
}

class DiceBody extends StatefulWidget {
  const DiceBody({super.key});

  @override
  State<DiceBody> createState() => _DiceBodyState();
}

class _DiceBodyState extends State<DiceBody> {
  int LDiceNumber = 1;
  int RDiceNumber = 1;
  void rowNumber() {
    setState(() {
      LDiceNumber = Random().nextInt(6)+1;
      RDiceNumber = Random().nextInt(6)+1;
      print('You roll ($LDiceNumber, $RDiceNumber)');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    rowNumber();
                  },
                  child: Image.asset('images/dice$LDiceNumber.png')),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  rowNumber();
                },
                child: Image.asset('images/dice$RDiceNumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




