import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final String playerName;
  final int score;
  const ScoreCard({
    super.key,
    required this.playerName,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
          width: 220,
          child: Card(
            margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            color: const Color(0xFF7D92A7),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  playerName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 47, 46, 93),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70,
          width: 90,
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
            color: const Color(0xFF7D92A7),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  score.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 47, 46, 93),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
