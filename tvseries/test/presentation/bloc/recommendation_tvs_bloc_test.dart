import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late RecommendationTvsBloc recommendationTvsBloc;
  late MockGetTvsRecommendations mockGetTvsRecommendations;

  setUp(() {
    mockGetTvsRecommendations = MockGetTvsRecommendations();
    recommendationTvsBloc = RecommendationTvsBloc(mockGetTvsRecommendations);
  });

  const idTest = 1;
  final tvsTest = <Tvs>[];

  test("RecommendationTvsBloc initial state should be empty", () {
    expect(recommendationTvsBloc.state, TvsRecomEmpty());
  });

  group(
    'Recommendation TV series Test',
    () {
      blocTest<RecommendationTvsBloc, TvsState>(
        'Should emit [Loading, HasData] when recommendation TV series data is fetched successfully',
        build: () {
          when(mockGetTvsRecommendations.execute(idTest))
              .thenAnswer((_) async => Right(tvsTest));
          return recommendationTvsBloc;
        },
        act: (bloc) => bloc.add(const RecommendationTvs(idTest)),
        expect: () => [TvsRecomLoading(), TvsRecomHasData(tvsTest)],
        verify: (bloc) {
          verify(mockGetTvsRecommendations.execute(idTest));
        },
      );

      blocTest<RecommendationTvsBloc, TvsState>(
        'Should emit [Loading, Error] when get recommendation TV series data is failed to fetch',
        build: () {
          when(mockGetTvsRecommendations.execute(idTest)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return recommendationTvsBloc;
        },
        act: (bloc) => bloc.add(const RecommendationTvs(idTest)),
        expect: () =>
            [TvsRecomLoading(), const TvsRecomError('Server Failure')],
        verify: (bloc) {
          verify(mockGetTvsRecommendations.execute(idTest));
        },
      );

      blocTest<RecommendationTvsBloc, TvsState>(
        'should emits [Loading, Empty] when recommendation TV series data is empty',
        build: () {
          when(mockGetTvsRecommendations.execute(idTest))
              .thenAnswer((_) async => const Right([]));
          return recommendationTvsBloc;
        },
        act: (bloc) => bloc.add(const RecommendationTvs(idTest)),
        expect: () => <TvsState>[
          TvsRecomLoading(),
          const TvsRecomHasData([]),
        ],
      );
    },
  );
}
