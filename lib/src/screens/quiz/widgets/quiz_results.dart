import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prueba/src/controllers/quiz_controller.dart';
import 'package:prueba/src/controllers/quiz_state.dart';
import 'package:prueba/src/databasemanager/data_base_manager.dart';
import 'package:prueba/src/models/question.dart';
import 'package:prueba/src/repositories/quiz_repository.dart';
import 'package:prueba/src/screens/score/score_screen.dart';
import 'package:prueba/src/utils/constants.dart';
import 'package:prueba/src/widgets/custom_botton.dart';
import 'package:prueba/src/widgets/custom_textfield.dart';

class QuizResults extends StatelessWidget {
  final QuizState state;
  final List<Question> questions;

  QuizResults({
    Key? key,
    required this.state,
    required this.questions,
  }) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  DataBaseManager dataBaseManager = DataBaseManager();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${state.correct.length} / ${questions.length}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Sofia Pro'
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'CORRECT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sofia Pro'
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),
          CustomTextField(textEditingController: _textEditingController),
          const SizedBox(height: 30),
          CustomButton(
            title: 'Save Score',
            onTap: () {
              dataBaseManager
                  .addScorePlayer(_textEditingController.text,
                      state.correct.length.toString())
                  .then((value) => _textEditingController.clear());
            }, color: kSecondaryColor,
          ),
          const SizedBox(height: 10),
          CustomButton(
            title: 'Player Scores',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScoreScreen()),
              );
            }, color: kSecondaryColor,
          ),
          const SizedBox(height: 10),
          CustomButton(
            title: 'New Quiz',
            onTap: () {
              context.refresh(quizRepositoryProvider);
              context.read(quizControllerProvider).reset();
            }, color: kSecondaryColor,
          ),
        ],
      ),
    );
  }
}
