class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffeldAnswers() {
    final shuffledList = [...answers];
    shuffledList.shuffle();
    return shuffledList;
  }
}
