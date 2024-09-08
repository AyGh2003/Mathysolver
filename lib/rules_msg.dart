import 'package:flutter/material.dart';

List<TextSpan> getRules() {
  return [
    const TextSpan(
      text: 'Welcome to Mathysolver!\n',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 47, 46, 93),
      ),
    ),
    const TextSpan(
      text:
          '''Think you're a mathematical genius? If so, it's time to prove your skills in this challenge and aim for the top score among your friends.\n\n''',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    const TextSpan(
      text: 'Rules and Scoring:\n',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 47, 46, 93),
      ),
    ),
    const TextSpan(
      text: '''
- You have 100 equations to solve within 15 minutes.
- For each correct answer, your score increases by 10 points.
- For each wrong answer, 5 points will be deducted from your score.
- If you skip a question, 5 points will also be deducted.
- Once you've seen an equation, it won't appear again, even if you skip it.
- Take as much time as you need for each equation, but remember, you only have 15 minutes to solve all 100.
- If you solve all 100 equations correctly before time runs out, you'll earn bonus points (1 point for every second remaining).
- If you complete all 100 equations before time runs out but have any wrong answers, you won't receive any bonus points.
- Lastly, cheating won’t earn you any credit, so just do your best and have fun!

''',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    const TextSpan(
      text: 'Additional Remarks:\n',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 47, 46, 93),
      ),
    ),
    const TextSpan(
      text: '''
- Use a period (.) instead of a comma (,), for example, write 3.5 instead of 3,5.
- For addition, use the + symbol: x + y.
- For subtraction, use the - symbol: x - y.
- For multiplication, use the * symbol: x * y.
- For division, use the / symbol: x / y.
- For exponents, use the ** symbol: x ** y (e.g., x ** 2 means x raised to the power of 2).

''',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    const TextSpan(
      text: 'Enjoy the challenge and good luck!',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 47, 46, 93),
      ),
    ),
  ];
}
