import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/entities/number_trivia.dart';

abstract class NumberTriviaRemoteDataSource {
  ///
  ///
  Future<NumberTrivia> getConcreteNumberTrivia(int number);

  Future<NumberTrivia> getRandomNumberTrivia();
}
