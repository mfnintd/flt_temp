import 'package:example_code/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PersonProvider(),
        ),
      ],
      child: const MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<PersonProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: context.watch<PersonProvider>().isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: List.generate(
                  context.watch<PersonProvider>().people.length,
                  (index) => Text(
                    context.watch<PersonProvider>().people[index].toString(),
                  ),
                ),
              ),
      ),
    );
  }
}
