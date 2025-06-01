import 'package:flutter/material.dart';
import 'package:translate_trainer/features/home/widgets/home_element_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            HomeElementBox(screenRoute: '/second', text: 'Add Sentence'),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            HomeElementBox(screenRoute: '/second', text: 'All Sentences'),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            HomeElementBox(screenRoute: '/second', text: 'Start Training'),
          ],
        ),
      ),
    );
  }
}
