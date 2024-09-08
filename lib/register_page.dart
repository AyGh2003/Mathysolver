import 'package:flutter/material.dart';
import 'game_page.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();

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
              height: 350,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(20),
                color: const Color.fromARGB(255, 199, 200, 205),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: Card(
                        color: Color.fromARGB(100, 191, 222, 252),
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Center(
                          child: Text(
                            'Save your score :',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 47, 46, 93),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 15.0,
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(100, 86, 96, 141),
                          hintText: 'Type your name here ... ',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none, // No border by default
                          ),
                        ),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 47, 46, 93),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (nameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter your name before proceeding.',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return GamePage(name: nameController.text);
                              },
                            ),
                          );
                        }
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
                        backgroundColor:
                            const Color.fromARGB(100, 191, 222, 252),
                      ),
                      child: const Text(
                        'Start',
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const HomePage();
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

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  } // to clean up the controller
}
