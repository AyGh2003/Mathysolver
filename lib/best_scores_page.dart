import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'score_card.dart';
import 'score_his.dart';

class BestScorePage extends StatelessWidget {
  const BestScorePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Score>>(
      future: loadScores(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Waiting case
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          // error case
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          // normal case
          final topScores =
              snapshot.data!; // getting informations (the topScores list)
          return Scaffold(
            backgroundColor: const Color(0xFF7D92A7),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 700,
                    child: Card(
                      color: const Color.fromARGB(255, 199, 200, 205),
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/Medaille.png'),
                              ),
                            ),
                          ),
                          const Text(
                            'Top 5 Scores',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 47, 46, 93),
                            ),
                          ),
                          Column(
                            children: topScores.map((score) {
                              return ScoreCard(
                                playerName: score.name,
                                score: score.result,
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const HomePage();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      foregroundColor: const Color.fromARGB(255, 47, 46, 93),
                      backgroundColor: const Color.fromARGB(255, 199, 200, 205),
                    ),
                    child: const Text(
                      'OK',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
