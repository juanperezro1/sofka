import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba/src/screens/quiz/quiz_screen.dart';
import 'package:prueba/src/screens/welcome/widgets/custom_bottom.dart';
import 'package:prueba/src/utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/sofka-logo.svg',
                    height: 130,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Quiz App",
                    style: TextStyle(fontSize: 40, fontFamily: 'Sofia Pro'),
                  ),
                  const Spacer(), // 1/6
                  CustomBottom(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen()),
                        );
                      },
                      text: const Text(
                        'Start',
                        style: TextStyle(color: Colors.white),
                      )),
                  const Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
