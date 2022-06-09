import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late PopularTvsBloc popularTvsBloc;
  late MockGetPopularTvs mockGetPopularTvs;

  setUp(() {
    mockGetPopularTvs = MockGetPopularTvs();
    popularTvsBloc = PopularTvsBloc(mockGetPopularTvs);
  });

  final tvsList = <Tvs>[];

  test("PopularTvsBloc initial state should be empty", () {
    expect(popularTvsBloc.state, PopularTvsEmpty());
  });

  group('Popular TV series test', () {
    blocTest<PopularTvsBloc, TvsState>(
        'Should emit [Loading, HasData] when popular TV series data is fetched successfully',
        build: () {
          when(mockGetPopularTvs.execute())
              .thenAnswer((_) async => Right(tvsList));
          return popularTvsBloc;
        },
        act: (bloc) => bloc.add(PopularTvs()),
        expect: () => [PopularTvsLoading(), PopularTvsHasData(tvsList)],
        verify: (bloc) {
          verify(mockGetPopularTvs.execute());
        });

    blocTest<PopularTvsBloc, TvsState>(
        'Should emit [Loading, Error] when popular TV series data is failed to fetch',
        build: () {
          when(mockGetPopularTvs.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return popularTvsBloc;
        },
        act: (bloc) => bloc.add(PopularTvs()),
        expect: () =>
            [PopularTvsLoading(), const PopularTvsError('Server Failure')],
        verify: (bloc) {
          verify(mockGetPopularTvs.execute());
        });
  });
}
