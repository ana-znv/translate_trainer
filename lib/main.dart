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
          backgroundColor: const Color.fromARGB(255, 39, 39, 39),
          iconTheme: IconThemeData(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 46, 46, 46),
          ),
        ),
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => AddSentence(),
        '/list': (context) => ListOfSentences(),
        '/start': (context) => StartTraining(),
      },
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
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },
                child: Text("Add Sentence", style: theme.textTheme.bodyMedium),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: 5)),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },
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
                onPressed: () {
                  Navigator.pushNamed(context, '/start');
                },
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

class AddSentence extends StatefulWidget {
  const AddSentence({super.key});

  @override
  State<AddSentence> createState() => _AddSentenceState();
}

class _AddSentenceState extends State<AddSentence> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Sentence", style: theme.textTheme.titleMedium),
      ),
    );
  }
}

class ListOfSentences extends StatefulWidget {
  const ListOfSentences({super.key});

  @override
  State<ListOfSentences> createState() => _ListOfSentencesState();
}

class _ListOfSentencesState extends State<ListOfSentences> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Sentences", style: theme.textTheme.titleMedium),
      ),
    );
  }
}

class StartTraining extends StatefulWidget {
  const StartTraining({super.key});

  @override
  State<StartTraining> createState() => _StartTrainingState();
}

class _StartTrainingState extends State<StartTraining> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Training", style: theme.textTheme.titleMedium),
      ),
    );
  }
}
