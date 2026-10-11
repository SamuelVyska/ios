import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roll-the-Dice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final Random _random = Random();
  int _diceValue = 1;

  void _rollDice() {
    setState(() {
      // nextInt(6) vracia 0–5, preto pridáme 1.
      _diceValue = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23162E),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Roll-the-Dice',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Image.asset(
                'assets/images/dice-$_diceValue.png',
                width: 220,
                height: 220,
                semanticLabel: 'Kocka: $_diceValue',
              ),
              const SizedBox(height: 24),
              Text(
                'Hodnota: $_diceValue',
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _rollDice,
                child: const Text('Hodiť kockou'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
