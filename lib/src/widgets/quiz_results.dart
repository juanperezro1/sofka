import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/src/controllers/quiz_controller.dart';
import 'package:prueba/src/controllers/quiz_state.dart';
import 'package:prueba/src/databasemanager/data_base_manager.dart';
import 'package:prueba/src/models/question.dart';
import 'package:prueba/src/repositories/quiz_repository.dart';
import 'package:prueba/src/screens/score/score_screen.dart';
import 'package:prueba/src/widgets/custom_bottom.dart';
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
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'CORRECT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
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
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            title: 'Player Scores',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScoreScreen()),
              );
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            title: 'New Quiz',
            onTap: () {
              context.refresh(quizRepositoryProvider);
              context.read(quizControllerProvider).reset();
            },
          ),
        ],
      ),
    );
  }
}
