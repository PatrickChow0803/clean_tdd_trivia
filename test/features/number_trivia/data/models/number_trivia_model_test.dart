import 'package:clean_tdd_trivia/features/number_trivia.dart/data/models/number_trivia_model.dart';
import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

// test checks to see if the NumberTriviaModel is a NumberTrivia entity
void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test text');

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
}
