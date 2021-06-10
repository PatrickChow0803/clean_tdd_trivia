import 'dart:convert';

import 'package:clean_tdd_trivia/features/number_trivia.dart/data/models/number_trivia_model.dart';
import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

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

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        // convert the trivia.json file to a string
        // and then use json.decode to convert the string into a Map<String, dynamic>
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));
        // act
        final result = NumberTriviaModel.fromJson(jsonMap);

        // assert
        expect(result, tNumberTriviaModel);
      },
    );
  });
}
