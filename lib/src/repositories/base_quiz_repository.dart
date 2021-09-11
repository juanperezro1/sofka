

import 'package:prueba/src/enums/difficulty.dart';
import 'package:prueba/src/models/question.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    int numQuestions,
    int categoryId,
    Difficulty difficulty,
  });
}