class Flashcard {
  final String question;
  final bool isTrue;

  Flashcard({required this.question, required this.isTrue});

  // Convert a Flashcard object into a Map.
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'isTrue': isTrue,
    };
  }

  // Convert a Map into a Flashcard object.
  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      question: json['question'],
      isTrue: json['isTrue'],
    );
  }
}