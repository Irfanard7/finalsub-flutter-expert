import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search/search.dart';
import 'package:tvseries/tvseries.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvsSearchBloc tvsSearchBloc;
  late MockSearchTvs mockSearchTvs;

  final tvsModelTest = Tvs(
      backdropPath: 'backdropPath',
      genreIds: const [1, 3],
      id: 1,
      originalName: 'originalName',
      overview: 'overview',
      popularity: 10.9,
      posterPath: 'posterPath',
      firstAirDate: '2019-09-17',
      name: 'name',
      voteAverage: 18.76,
      voteCount: 877);

  final tvsListTest = <Tvs>[tvsModelTest];
  const queryTest = 'Spy x Family';

  setUp(() {
    mockSearchTvs = MockSearchTvs();
    tvsSearchBloc = TvsSearchBloc(mockSearchTvs);
  });

  group('Search TV series with bloc', () {
    test('initial state should be empty', () {
      expect(tvsSearchBloc.state, SearchEmpty());
    });

    blocTest<TvsSearchBloc, SearchState>(
      'Should emit [Loading, HasData] when search TV series data is successfully',
      build: () {
        when(mockSearchTvs.execute(queryTest))
            .thenAnswer((_) async => Right(tvsListTest));
        return tvsSearchBloc;
      },
      act: (bloc) => bloc.add(const OnQueryChanged(queryTest)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchHasTvsData(tvsListTest),
      ],
      verify: (bloc) {
        verify(mockSearchTvs.execute(queryTest));
      },
    );

    blocTest<TvsSearchBloc, SearchState>(
      'Should emit [Loading, Error] when get TV series search is unsuccessful',
      build: () {
        when(mockSearchTvs.execute(queryTest)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return tvsSearchBloc;
      },
      act: (bloc) => bloc.add(const OnQueryChanged(queryTest)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        const SearchError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockSearchTvs.execute(queryTest));
      },
    );
  });
}
