import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.resetQuiz, {super.key, required this.choosenAnswers});
  final void Function() resetQuiz;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'choosen_answer': choosenAnswers[i],
      });
    }

    return summary;
  }

// Text(((data['question_index'] as int) + 1).toString()),
  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final totalCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['choosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Congrats! You finished the quiz!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                  "Answered $totalCorrectAnswers out of $totalQuestions correctly!",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
              const SizedBox(height: 40),
              QuestionsSummary(summaryData),
              const SizedBox(height: 40),
              OutlinedButton.icon(
                onPressed: () {
                  resetQuiz();
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 76, 3, 3),
                    backgroundColor: Colors.white),
                icon: const Icon(Icons.restart_alt),
                label: const Text('Reset Quiz'),
              )
            ],
          )),
    );
  }
}
