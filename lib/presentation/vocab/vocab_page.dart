import 'package:flutter/material.dart';

class VocabularyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vocabulary"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text('My definitions'),
        ],
      )),
    );
  }
}
