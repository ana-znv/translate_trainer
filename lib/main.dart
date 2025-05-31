import 'package:flutter/material.dart';

void main() {
  runApp(const TranslateTrainer());
}

class TranslateTrainer extends StatelessWidget {
  const TranslateTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 18, 18),
        title: Text("Translate Trainer", style: TextStyle(color: Colors.white)),
        actions: [
          Icon(Icons.search, color: Colors.white),
          Padding(padding: EdgeInsets.all(10)),
          Icon(Icons.notifications_outlined, color: Colors.white),
          Padding(padding: EdgeInsets.only(right: 20)),
        ],
        centerTitle: false,
      ),
    );
  }
}
