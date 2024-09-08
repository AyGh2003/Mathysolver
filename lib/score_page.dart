import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'best_scores_page.dart';
import 'score_his.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final String name;
  const ScorePage({super.key, required this.score, required this.name});

  Future<List<Score>> loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? scoreStrings = prefs.getStringList('topScores');
    if (scoreStrings != null) {
      return scoreStrings.map((s) {
        final parts = s.split(':');
        return Score(parts[0], int.parse(parts[1]));
      }).toList();
    } // transform the list of strings (saved in the device) into list of scores
    return [
      Score('playerName', 0),
      Score('playerName', 0),
      Score('playerName', 0),
      Score('playerName', 0),
      Score('playerName', 0),
    ]; // In the case where there isn't any new score added
  }

  Future<void> saveScores(List<Score> scores) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> scoreStrings =
        scores.map((s) => '${s.name}:${s.result}').toList();
    await prefs.setStringList('topScores', scoreStrings);
  } // transform the scores list into string list to store using shared_preferences

  void updateScore(Score s, List<Score> best) {
    int score = s.result;
    if (score > best[0].result) {
      best[4] = best[3];
      best[3] = best[2];
      best[2] = best[1];
      best[1] = best[0];
      best[0] = s;
    } else if (score > best[1].result) {
      best[4] = best[3];
      best[3] = best[2];
      best[2] = best[1];
      best[1] = s;
    } else if (score > best[2].result) {
      best[4] = best[3];
      best[3] = best[2];
      best[2] = s;
    } else if (score > best[3].result) {
      best[4] = best[3];
      best[3] = s;
    } else if (score > best[4].result) {
      best[4] = s;
    } else {
      return;
    }
    // Save the updated scores
    saveScores(best);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7D92A7),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                'images/TopRight.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                'images/BottomLeft.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(20),
                color: const Color.fromARGB(255, 199, 200, 205),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'You scored $score points',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 47, 46, 93),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        topScores = await loadScores();
                        updateScore(Score(name, score), topScores);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const BestScorePage();
                          }),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        foregroundColor:
                            const Color.fromARGB(255, 199, 200, 205),
                        backgroundColor: const Color.fromARGB(255, 52, 60, 105),
                      ),
                      child: const Text(
                        'OK',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
