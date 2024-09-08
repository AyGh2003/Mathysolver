import 'package:flutter/material.dart';
import 'dart:async'; // for the timer
import 'dart:math'; // for the Random class
import 'register_page.dart';
import 'equation_game.dart';
import 'score_page.dart';

class GamePage extends StatefulWidget {
  final String name;
  const GamePage({super.key, required this.name});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Timer timer;
  final TextEditingController answerController = TextEditingController();
  Duration timeRemaining = const Duration(minutes: 15);
  List<int> numbers = List.generate(101, (i) => i + 1);
  Color scoreColor = const Color.fromARGB(255, 199, 200, 205);
  int score = 0;
  int i = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
    numbers.shuffle(Random()); // Shuffle the numbers in initState
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (timeRemaining.inSeconds > 0 && i < 100) {
            timeRemaining = timeRemaining - const Duration(seconds: 1);
          } else {
            if (score == 1000) {
              score = timeRemaining.inSeconds + score;
            }
            timer.cancel();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return ScorePage(
                  score: score,
                  name: widget.name,
                );
              }),
            );
          }
        });
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    answerController.dispose();
    super.dispose();
  }

  bool verif(String ans, int i) {
    return (double.parse(ans) == Equation.getRes(i, listEquations));
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7D92A7),
      body: Stack(
        children: [
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 30, 0),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 50,
                width: 180,
                child: Card(
                  color: scoreColor,
                  child: Center(
                    child: Text(
                      'Score | $score',
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 50,
                width: 100,
                child: Card(
                  color: const Color.fromARGB(255, 199, 200, 205),
                  child: Center(
                    child: Text(
                      formatDuration(timeRemaining),
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
          ),
          Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 365,
                  width: double.infinity,
                  child: Card(
                    color: const Color.fromARGB(255, 238, 238, 241),
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Card(
                            margin: const EdgeInsets.all(15),
                            color: const Color.fromARGB(255, 202, 207, 230),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  Equation.getEq(numbers[i], listEquations),
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: answerController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 15.0,
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(100, 86, 96, 141),
                              hintText: '= ',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 47, 46, 93),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 10, 10, 10),
                              child: SizedBox(
                                height: 50,
                                width: 135,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (verif(
                                        answerController.text, numbers[i])) {
                                      score = score + 10;
                                      scoreColor = Colors.green;
                                    } else {
                                      score = score - 5;
                                      scoreColor = Colors.red;
                                    }
                                    setState(() {
                                      answerController.clear();
                                      i++;
                                    });
                                    // Reset the score color back to the normal state after 1 second
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      setState(() {
                                        scoreColor = const Color.fromARGB(255,
                                            199, 200, 205); // The default color
                                      });
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    foregroundColor:
                                        const Color.fromARGB(255, 47, 46, 93),
                                    backgroundColor: const Color.fromARGB(
                                        255, 202, 207, 230),
                                  ),
                                  child: const Text(
                                    'Answer',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: SizedBox(
                                height: 50,
                                width: 135,
                                child: ElevatedButton(
                                  onPressed: () {
                                    score = score - 5;
                                    i++;
                                    scoreColor = Colors.red;
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      setState(() {
                                        scoreColor = const Color.fromARGB(255,
                                            199, 200, 205); // The default color
                                      });
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    foregroundColor:
                                        const Color.fromARGB(255, 47, 46, 93),
                                    backgroundColor: const Color.fromARGB(
                                        255, 202, 207, 230),
                                  ),
                                  child: const Text(
                                    'Skip',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 80,
                    child: Card(
                      color: const Color.fromARGB(255, 184, 187, 199),
                      child: Center(
                        child: Text(
                          (i + 1).toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 47, 46, 93),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Invisible sizedbox to control the card placement
                  const SizedBox(
                    height: 290,
                    width: double.infinity,
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 20),
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    timer.cancel();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const RegisterPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    foregroundColor: const Color.fromARGB(255, 47, 46, 93),
                    backgroundColor: const Color.fromARGB(255, 199, 200, 205),
                  ),
                  child: const Text(
                    'Back',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
