import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:prueba/src/controllers/quiz_controller.dart';
import 'package:prueba/src/controllers/quiz_state.dart';
import 'package:prueba/src/enums/difficulty.dart';
import 'package:prueba/src/models/failure.dart';
import 'package:prueba/src/models/question.dart';
import 'package:prueba/src/repositories/quiz_repository.dart';
import 'package:prueba/src/screens/quiz/widgets/quiz_error.dart';
import 'package:prueba/src/screens/quiz/widgets/quiz_questions.dart';
import 'package:prueba/src/screens/quiz/widgets/quiz_results.dart';
import 'package:prueba/src/utils/constants.dart';
import 'package:prueba/src/widgets/custom_botton.dart';

class QuizScreen extends HookWidget {
  QuizScreen({Key? key}) : super(key: key);

  final quizQuestionsProvider = FutureProvider.autoDispose<List<Question>>(
    (ref) => ref.watch(quizRepositoryProvider).getQuestions(
          numQuestions: 25,
          categoryId: Random().nextInt(24) + 9,
          difficulty: Difficulty.any,
        ),
  );

  @override
  Widget build(BuildContext context) {
    final quizQuestions = useProvider(quizQuestionsProvider);
    final pageController = usePageController();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: quizQuestions.when(
        data: (questions) => _buildBody(context, pageController, questions),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => QuizError(
          message: error is Failure ? error.message : 'Something went wrong!',
        ),
      ),
      bottomSheet: quizQuestions.maybeWhen(
        data: (questions) {
          final quizState = useProvider(quizControllerProvider.state);
          if (!quizState.answered) return const SizedBox.shrink();
          return CustomButton(
            title: pageController.page!.toInt() + 1 < questions.length
                ? 'Next Question'
                : 'See Results',
            onTap: () {
              context
                  .read(quizControllerProvider)
                  .nextQuestion(questions, pageController.page!.toInt());
              if (pageController.page!.toInt() + 1 < questions.length) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              }
            }, color: kSecondaryColor,
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PageController pageController,
    List<Question> questions,
  ) {
    if (questions.isEmpty)
      return const QuizError(message: 'No questions found.');
    final quizState = useProvider(quizControllerProvider.state);
    return quizState.status == QuizStatus.complete
        ? QuizResults(state: quizState, questions: questions)
        : QuizQuestions(
            pageController: pageController,
            state: quizState,
            questions: questions,
          );
  }
}
