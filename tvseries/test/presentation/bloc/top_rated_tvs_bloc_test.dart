import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late TopRatedTvsBloc topRatedTvsBloc;
  late MockGetTopRatedTvs mockGetTopRatedTvs;

  setUp(() {
    mockGetTopRatedTvs = MockGetTopRatedTvs();
    topRatedTvsBloc = TopRatedTvsBloc(mockGetTopRatedTvs);
  });

  test("TopRatedTvsBloc initial state should be empty", () {
    expect(topRatedTvsBloc.state, TopRatedTvsEmpty());
  });

  final tvsList = <Tvs>[];
  group(
    'Top rated TV series test',
    () {
      blocTest<TopRatedTvsBloc, TvsState>(
        'Should emit [Loading, HasData] when top rated movie data is fetched successfully',
        build: () {
          when(mockGetTopRatedTvs.execute())
              .thenAnswer((_) async => Right(tvsList));
          return topRatedTvsBloc;
        },
        act: (bloc) => bloc.add(TopRatedTvs()),
        expect: () => [TopRatedTvsLoading(), TopRatedTvsHasData(tvsList)],
        verify: (bloc) {
          verify(mockGetTopRatedTvs.execute());
        },
      );

      blocTest<TopRatedTvsBloc, TvsState>(
        'Should emit [Loading, Error] when get top rated movie data is failed to fetched',
        build: () {
          when(mockGetTopRatedTvs.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return topRatedTvsBloc;
        },
        act: (bloc) => bloc.add(TopRatedTvs()),
        expect: () =>
            [TopRatedTvsLoading(), const TopRatedTvsError('Server Failure')],
        verify: (bloc) {
          verify(mockGetTopRatedTvs.execute());
        },
      );
    },
  );
}
