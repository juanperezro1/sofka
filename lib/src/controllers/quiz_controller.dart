import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prueba/src/controllers/quiz_state.dart';
import 'package:prueba/src/models/question.dart';


final quizControllerProvider =
    StateNotifierProvider.autoDispose<QuizController>(
  (ref) => QuizController(),
);

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());

  void submitAnswer(Question currentQuestion, String answer) {
    if (state.answered) return;
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: state.correct..add(currentQuestion),
        status: QuizStatus.correct,
      );
    } else {
      state = state.copyWith(
        selectedAnswer: answer,
        incorrect: state.incorrect..add(currentQuestion),
        status: QuizStatus.complete,
      );
    }
  }

  void nextQuestion(List<Question> questions, int currentIndex) {
    state = state.copyWith(
      selectedAnswer: '',
      status: currentIndex + 1 < questions.length
          ? QuizStatus.initial
          : QuizStatus.complete,
    );
  }

  void reset() {
    state = QuizState.initial();
  }
}

