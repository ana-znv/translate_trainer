import '../features/add_sentence/add_sentence.dart';
import '../features/home/home.dart';
import '../features/list_of_sentences/list_of_sentences.dart';
import '../features/start_training/start_training.dart';

final routes = {
  '/': (context) => HomeScreen(),
  '/add': (context) => AddSentence(),
  '/list': (context) => ListOfSentences(),
  '/start': (context) => StartTraining(),
};
