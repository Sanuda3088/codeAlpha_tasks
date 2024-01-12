import 'package:flashcard_app/flashcard.dart';
import 'package:flutter/material.dart';


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
        title: Text('Add Flashcard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('Is True:'),
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
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveFlashcard();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveFlashcard() {
    final question = _questionController.text;

    if (question.isNotEmpty) {
      Navigator.pop(
        context,
        Flashcard(question: question, isTrue: _isTrue),
      );
    }
  }
}
