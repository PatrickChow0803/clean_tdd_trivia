import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/entities/number_trivia.dart';
import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/repositories/number_trivia_repository.dart';
import 'package:clean_tdd_trivia/features/number_trivia.dart/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_concrete_trivia_test.mocks.dart';

// since data from NumberTriviaRepository is needed here, implement from it
// don't do it this way anymore with null safety mockito, use the @GenerateMocks([Real Class Name])
// and then use flutter pub run build_runner build --delete-conflicting-outputs in the terminal to generate files for null safety mockito
// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaRepository {}

@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange - set it up how you want
      // when mockNumberTriviaRepository.getConcreteNumberTrivia is called on it with any argument
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
          // use .thenAnswer here because .getConcreteNumberTrivia is async
          // use .thenReturn if it wasn't async
          // use a => since it's async
          // since return type of .getConcreteNumberTrivia is Either a Failure or a NumberTrivia
          // in the test, it doesn't matter what's returned. Can either return a Failure or a NumberTrivia
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act - execute what you want
      final result = await usecase.execute(number: tNumber);
      // assert - what the output should be
      expect(result, Right(tNumberTrivia));
      // makes sure that .getConcreteNumberTrivia was actually called with the correct input
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(1));
      // makes sure that nothing else is working on the repository  after the .execute command is called
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
