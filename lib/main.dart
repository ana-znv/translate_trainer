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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 32, 32, 32),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: const Color.fromARGB(255, 213, 213, 213),
            fontSize: 26,
          ),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 22),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 46, 46, 46),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Translate Trainer", style: theme.textTheme.titleMedium),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Add Sentence", style: theme.textTheme.bodyMedium),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: 5)),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "List of Sentences",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: 5)),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Start Training",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}