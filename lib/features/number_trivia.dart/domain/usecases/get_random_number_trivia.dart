import 'package:clean_tdd_trivia/core/error/failures.dart';
import 'package:clean_tdd_trivia/core/usecases/usecase.dart';
import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/entities/number_trivia.dart';
import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// ALl this does is get the data from the repository
// NOT from the data layer!!!
// implements UseCase so that you don't forget about the call method
// NumberTrivia is the type. And Int is the param since an int is needed for .getConcreteNumberTrivia

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    // TODO: implement call
    return await repository.getRandomNumberTrivia();
  }
}
