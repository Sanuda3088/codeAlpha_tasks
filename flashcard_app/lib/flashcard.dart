class Flashcard {
  String question;
  bool isTrue;

  Flashcard({required this.question, required this.isTrue});

  static fromJson(Map<String, dynamic> data) {}
}
