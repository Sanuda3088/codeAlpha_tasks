import 'package:flashcard_app/flashcard_form_screen.dart';
import 'package:flutter/material.dart';
import 'flashcard.dart';

class FlashcardListScreen extends StatefulWidget {
  @override
  _FlashcardListScreenState createState() => _FlashcardListScreenState();
}

class _FlashcardListScreenState extends State<FlashcardListScreen> {
  List<Flashcard> flashcards = [];
  List<Flashcard> allFlashcards = [];
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(flashcards[index].question),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _checkAnswer(index, true);
                              },
                              child: const Text('True'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _checkAnswer(index, false);
                              },
                              child: const Text('False'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _deleteQuestion(index);
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _resetQuestions();
                },
                child: const Text('Reset'),
              ),
            ],
          ),
          Text('Score: $score'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToFlashcardFormScreen();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _checkAnswer(int index, bool selectedAnswer) {
    setState(() {
      if (flashcards[index].isTrue == selectedAnswer) {
        score++;
      }
      // Remove the answered question from the list
      flashcards.removeAt(index);
    });
  }

  void _resetQuestions() {
    setState(() {
      // Assign all questions from allFlashcards to flashcards
      flashcards = List.from(allFlashcards);
      // Reset the score
      score = 0;
    });
  }

  void _deleteQuestion(int index) {
  setState(() {
    // Remove the selected question from both flashcards and allFlashcards lists
    flashcards.removeAt(index);

    if (index < allFlashcards.length) {
      allFlashcards.removeAt(index);
    }

    // You may also want to update the score or perform any additional actions.
  });
}


  void _navigateToFlashcardFormScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FlashcardFormScreen()),
    );

    if (result != null && result is Flashcard) {
      setState(() {
        allFlashcards.add(result);
        flashcards.add(result);
      });
    }
  }
}

List<Flashcard> fetchAllQuestions() {
  List<Flashcard> allQuestions = [
    //Flashcard(question: 'This is a Default one', isTrue: true),
    // Add more questions as needed
  ];

  return allQuestions;
}
