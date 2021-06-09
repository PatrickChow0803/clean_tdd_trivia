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
class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  // renamed execute to call. This makes it so that you don't need to do usecase.execute(...)
  // in the test file of the act section of the test. You can instead just do usecase(...) in the test file
  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  List<Object?> get props => [number];
}
