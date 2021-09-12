import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:prueba/src/screens/quiz/quiz_screen.dart';
import 'package:prueba/src/screens/score/score_screen.dart';
import 'package:prueba/src/utils/constants.dart';
import 'package:prueba/src/widgets/custom_botton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  SvgPicture.asset(
                    'assets/images/sofka.svg',
                    height: 130,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Quiz App",
                    style: TextStyle(fontSize: 40, fontFamily: 'Sofia Pro'),
                  ),
                  const Spacer(),
                  CustomButton(
                    title: 'Start',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizScreen()),
                      );
                    }, color: kPrimaryColor,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    title: 'Player Score',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScoreScreen()),
                      );
                    }, color: kSecondaryColor,
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
