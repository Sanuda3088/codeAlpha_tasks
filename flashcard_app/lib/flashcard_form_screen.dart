import 'package:flashcard_app/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FlashcardFormScreen extends StatefulWidget {
  @override
  _FlashcardFormScreenState createState() => _FlashcardFormScreenState();
}

class _FlashcardFormScreenState extends State<FlashcardFormScreen> {
  final TextEditingController _questionController = TextEditingController();
  bool _isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 11, 208, 175),
        centerTitle: true,
        title: const Text('Add Flashcard'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 11, 208, 175),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _questionController,
                decoration: const InputDecoration(labelText: 'Question'),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text('Is True:'),
                  Switch(
                    value: _isTrue,
                    onChanged: (value) {
                      setState(() {
                        _isTrue = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _saveFlashcard();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*void _saveFlashcard() {
    final question = _questionController.text;

    if (question.isNotEmpty) {
      Navigator.pop(
        context,
        Flashcard(question: question, isTrue: _isTrue),
      );
    }
  }*/
  void _saveFlashcard() async {
    final question = _questionController.text;

    if (question.isNotEmpty) {
      final flashcard = Flashcard(question: question, isTrue: _isTrue);

      // Get reference to shared preferences
      final prefs = await SharedPreferences.getInstance();

      // Get the list of flashcards, if it exists, or initialize to an empty list
      List<String> flashcards = prefs.getStringList('flashcards') ?? [];

      // Add the new flashcard to the list
      flashcards.add(jsonEncode(flashcard.toJson()));

      // Save the list of flashcards
      await prefs.setStringList('flashcards', flashcards);

      Navigator.pop(context, flashcard);
    }
  }
}


