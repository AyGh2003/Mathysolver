import 'package:flutter/material.dart';
import 'rules_page.dart';
import 'best_scores_page.dart';
import 'register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7D92A7),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Image.asset(
                'images/Mathysolver.png',
                fit: BoxFit.cover,
              ),
            ), // The Logo
            const SizedBox(
              height: 30,
            ), // space
            ElevatedButton(
              // The start buttom
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const RegisterPage();
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ), // I used it to controle the size
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
                'Start',
              ),
            ),
            // The start buttom end here
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              // The rules buttom
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const RulePage();
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ),
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
                'Rules',
              ),
            ),
            // The Rules button end here
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              // Best scores buttom
              onPressed: () {
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
                foregroundColor: const Color.fromARGB(255, 47, 46, 93),
                backgroundColor: const Color.fromARGB(255, 199, 200, 205),
              ),
              child: const Text(
                'Best Scores',
              ),
            ),
            // The Best Scores button end here
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
