import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/entities/number_trivia.dart';

// this modal of number trivia should be a subclass of the entity NumberTrivia
class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    required String text,
    required int number,
  }) : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }
}
