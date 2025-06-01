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
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
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
  WidgetStateProperty<Color> buttonBackgroundColor = WidgetStateProperty.all(
    Color.fromARGB(255, 134, 110, 254),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: buttonBackgroundColor,
                  foregroundColor: WidgetStateProperty.all(Colors.amber),
                ),
                child: Text("Add Sentence", style: theme.textTheme.bodyMedium),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: buttonBackgroundColor,
                  foregroundColor: WidgetStateProperty.all(Colors.amber),
                ),
                child: Text("All Senteces", style: theme.textTheme.bodyMedium),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: buttonBackgroundColor,
                  foregroundColor: WidgetStateProperty.all(Colors.amber),
                ),
                child: Text(
                  "Start training",
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
