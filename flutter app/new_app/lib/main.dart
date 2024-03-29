import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      title: 'Welcome to Flutter',
      
      home: Scaffold(
      
        appBar: AppBar(
      
          title: Text('Welcome to Flutter'),
          backgroundColor: Colors.purple,
      
        ),
      
        body: Center(
      
          child: RandomWords(),

        ),
      
      ),
    
    );
  
  }

}


class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}