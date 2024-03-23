import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  int status = 0; // 0 home, 1 play, 2 over
  int score = 0;
  int highScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: status == 0
            ? _homeScreen()
            : status == 1
                ? _playingScreen()
                : _gameOverScreen(),
      ),
    );
  }

  void _traloidung() {
    setState(() {
      score++;
      // load 1 phép tính mới
    });
  }

  void _traloisai() {
    highScore = max(highScore, score);
    status = 2;
    setState(() {});
  }

  Column _homeScreen() {
    return Column(
      children: [
        const Text('Freaking Math'),
        IconButton(
          onPressed: () {
            setState(() {
              status = 1;
            });
          },
          icon: const Icon(Icons.play_arrow),
        ),
      ],
    );
  }

  Column _playingScreen() {
    return Column(
      children: [
        Text('$score'),
        const Text('1 + 1 = 3'),
        Row(
          children: [
            IconButton(
              onPressed: () {
                _traloidung();
              },
              icon: const Icon(Icons.check),
            ),
            IconButton(
              onPressed: () {
                _traloisai();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        )
      ],
    );
  }

  Column _gameOverScreen() {
    return Column(
      children: [
        const Text('Game over'),
        const Text('Your score: àdklaj'),
        const Text('High Score: ạdasd'),
        IconButton(
            onPressed: () {
              setState(() {
                status = 1;
              });
            },
            icon: const Icon(Icons.play_arrow)),
        IconButton(
            onPressed: () {
              setState(() {
                status = 0;
              });
            },
            icon: const Icon(Icons.home)),
      ],
    );
  }
}
