import 'package:flutter/material.dart';
import 'home_page.dart';
import 'rules_msg.dart';

class RulePage extends StatelessWidget {
  const RulePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7D92A7),
      body: SingleChildScrollView(
        // to be able to scroll
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Card(
              margin: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 199, 200, 205),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(
                    children: [...getRules()],
                    // Spread Operator (...): The spread operator is used to unpack the List<TextSpan> returned by getRules()
                    //into individual TextSpan objects that can be directly added to the children list of TextSpan.
                  ),
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
                  fontSize: 28,
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
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
