import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  TextStyle correctAnswer() {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.greenAccent,
    );
  }

  TextStyle wrongAnswer() {
    return const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  checkIfCorrectAnswer(Map<String, Object> data) {
    if (data['correct_answer'] == data['choosen_answer']) {
      return CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(((data['question_index'] as int) + 1).toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(((data['question_index'] as int) + 1).toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                checkIfCorrectAnswer(data),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Text(data['question'] as String,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      const SizedBox(height: 5),
                      Text(
                        (data['choosen_answer'] as String),
                        textAlign: TextAlign.left,
                        style: wrongAnswer(),
                      ),
                      Text(
                        'Correct answer: ${data['correct_answer'] as String}',
                        textAlign: TextAlign.left,
                        style: correctAnswer(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
