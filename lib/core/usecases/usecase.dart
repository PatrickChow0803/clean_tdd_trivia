import 'package:clean_tdd_trivia/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// create a general usecase for get_concrete and get_random
// since the return type of both of those use cases are Future<Either<Failure, ...>>
// you can make this generalization for the call method that they should both have
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
