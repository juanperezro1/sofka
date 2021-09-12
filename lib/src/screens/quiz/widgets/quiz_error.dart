import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prueba/src/repositories/quiz_repository.dart';
import 'package:prueba/src/utils/constants.dart';
import 'package:prueba/src/widgets/custom_botton.dart';


class QuizError extends StatelessWidget {
  final String message;

  const QuizError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20.0),
          CustomButton(
            title: 'Retry',
            onTap: () => context.refresh(quizRepositoryProvider), color: kSecondaryColor,
          ),
        ],
      ),
    );
  }
}