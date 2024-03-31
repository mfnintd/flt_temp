import 'dart:math';

import 'package:flutter/material.dart';

import 'todo.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Hehe(),
    ),
  );
}

class Hehe extends StatelessWidget {
  const Hehe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            //fit: FlexFit.tight,
            child: Container(
              color: Colors.red,
            ),
          ),
          const Spacer(flex: 2),
          Expanded(
            flex: 1,
            child: Container(color: Colors.blue),
          ),
          Flexible(
            flex: 1,
            child: Container(color: Colors.green),
          ),
        ],
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  FirstRoute({super.key});

  final List<Todo> todos = List.generate(10, (index) => Todo(title: 'Todo $index', des: 'Tôi yêu bạn $index lần'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondRoute(todo: todos[index]),
              ),
            );
          },
          child: ListTile(
            title: Text(todos[index].title),
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({
    super.key,
    required this.todo,
  });
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Column(
        children: [
          Text(todo.des),
          ElevatedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
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
