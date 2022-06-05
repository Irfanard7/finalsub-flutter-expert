import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/usecases/tvs/get_tvs_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvsRecommendations tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = GetTvsRecommendations(mockTvsRepository);
  });

  final tId = 1;
  final tvsTest = <Tvs>[];

  test('should get list of TV series recommendations from the repository',
          () async {
        // arrange
        when(mockTvsRepository.getTvsRecommendations(tId))
            .thenAnswer((_) async => Right(tvsTest));
        // act
        final result = await tvsUsecase.execute(tId);
        // assert
        expect(result, Right(tvsTest));
      });
}