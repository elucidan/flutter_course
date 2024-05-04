import 'package:flutter/material.dart';
import 'styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            color: const Color.fromARGB(150, 255, 255, 255),
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 80,
          ),
          const StyledText(text: "Learn Flutter the fun way!"),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Start Quiz",
              ))
          //button
        ],
      ),
    );
  }
}
