import 'package:clean_tdd_trivia/core/error/failures.dart';
import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

// the repository inside of the domain layer is abstract
abstract class NumberTriviaRepository {
  // since this is a async call, return type is a future
  // the return type is either a Failure or a NumberTrivia Entitiy
  // therefore either a failure object or a NumberTrivia object will be passed up along the domain to the presentation
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int num);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
