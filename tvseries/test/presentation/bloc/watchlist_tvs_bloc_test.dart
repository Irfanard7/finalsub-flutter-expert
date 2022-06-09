import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistTvsBloc watchlistTvsBloc;
  late MockGetWatchlistTvs mockGetWatchlistTvs;
  late MockGetWatchlistTvsStatus mockGetWatchlistTvsStatus;
  late MockSaveTvsWatchlist mockSaveTvsWatchlist;
  late MockRemoveTvsWatchlist mockRemoveTvsWatchlist;

  setUp(() {
    mockGetWatchlistTvs = MockGetWatchlistTvs();
    mockGetWatchlistTvsStatus = MockGetWatchlistTvsStatus();
    mockSaveTvsWatchlist = MockSaveTvsWatchlist();
    mockRemoveTvsWatchlist = MockRemoveTvsWatchlist();
    watchlistTvsBloc = WatchlistTvsBloc(
        getWatchlistTvs: mockGetWatchlistTvs,
        getWatchlistTvsStatus: mockGetWatchlistTvsStatus,
        removeTvsWatchlist: mockRemoveTvsWatchlist,
        saveTvsWatchlist: mockSaveTvsWatchlist);
  });
  test('WatchlistTvsBloc initial state should be empty ', () {
    expect(watchlistTvsBloc.state, WatchlistTvsEmpty());
  });

  group('Get watchlist TV series test', () {
    blocTest<WatchlistTvsBloc, WatchlistTvsState>(
      'should emits [Loading, HasList] when watchlist TV series list data is successfully fetched',
      build: () {
        when(mockGetWatchlistTvs.execute())
            .thenAnswer((_) async => Right([tvsWatchlistTest]));
        return watchlistTvsBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvsList()),
      expect: () => [
        WatchlistTvsLoading(),
        WatchlistTvsHasList([tvsWatchlistTest]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvs.execute());
        return WatchlistTvsList().props;
      },
    );

    blocTest<WatchlistTvsBloc, WatchlistTvsState>(
      'should emits [Loading, Error] when watchlist TV series list data is failed to fetch',
      build: () {
        when(mockGetWatchlistTvs.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return watchlistTvsBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvsList()),
      expect: () => <WatchlistTvsState>[
        WatchlistTvsLoading(),
        const WatchlistTvsError('Server Failure'),
      ],
      verify: (bloc) => WatchlistTvsLoading(),
    );
  });

  group('Get watchlist status TV series test', () {
    blocTest<WatchlistTvsBloc, WatchlistTvsState>(
      'should be return true when the TV series watchlist is also true',
      build: () {
        when(mockGetWatchlistTvsStatus.execute(tvsDetailTest.id))
            .thenAnswer((_) async => true);
        return watchlistTvsBloc;
      },
      act: (bloc) => bloc.add(WatchlistStatusTvs(tvsDetailTest.id)),
      expect: () => [WatchlistTvsLoading(), const WatchlistTvsHasStatus(true)],
      verify: (bloc) {
        verify(mockGetWatchlistTvsStatus.execute(tvsDetailTest.id));
        return WatchlistStatusTvs(tvsDetailTest.id).props;
      },
    );

    blocTest<WatchlistTvsBloc, WatchlistTvsState>(
        'should be return false when the TV series watchlist is also false',
        build: () {
          when(mockGetWatchlistTvsStatus.execute(tvsDetailTest.id))
              .thenAnswer((_) async => false);
          return watchlistTvsBloc;
        },
        act: (bloc) => bloc.add(WatchlistStatusTvs(tvsDetailTest.id)),
        expect: () => <WatchlistTvsState>[
              WatchlistTvsLoading(),
              const WatchlistTvsHasStatus(false),
            ],
        verify: (bloc) {
          verify(mockGetWatchlistTvsStatus.execute(tvsDetailTest.id));
          return WatchlistStatusTvs(tvsDetailTest.id).props;
        });
  });

  group('Add watchlist TV series test', () {
    blocTest<WatchlistTvsBloc, WatchlistTvsState>(
      'should update watchlist status when add movie to watchlist is successfully',
      build: () {
        when(mockSaveTvsWatchlist.execute(tvsDetailTest))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        return watchlistTvsBloc;
      },
      act: (bloc) => bloc.add(const AddWatchlistTvs(tvsDetailTest)),
      expect: () => [
        const WatchlistTvsHasMessage('Added to Watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveTvsWatchlist.execute(tvsDetailTest));
        return const AddWatchlistTvs(tvsDetailTest).props;
      },
    );

    blocTest<WatchlistTvsBloc, WatchlistTvsState>(
      'should throw failure message status when failed to add TV series to watchlist',
      build: () {
        when(mockSaveTvsWatchlist.execute(tvsDetailTest)).thenAnswer(
            (_) async =>
                const Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistTvsBloc;
      },
      act: (bloc) => bloc.add(const AddWatchlistTvs(tvsDetailTest)),
      expect: () => [
        const WatchlistTvsError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockSaveTvsWatchlist.execute(tvsDetailTest));
        return const AddWatchlistTvs(tvsDetailTest).props;
      },
    );
  });

  group('Remove watchlist TV series test', () {
    blocTest<WatchlistTvsBloc, WatchlistTvsState>(
      'should update watchlist status when remove TV series from watchlist is successfully',
      build: () {
        when(mockRemoveTvsWatchlist.execute(tvsDetailTest))
            .thenAnswer((_) async => const Right('Removed from Watchlist'));
        return watchlistTvsBloc;
      },
      act: (bloc) => bloc.add(const RemoveWatchlistTvs(tvsDetailTest)),
      expect: () => [
        const WatchlistTvsHasMessage('Removed from Watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveTvsWatchlist.execute(tvsDetailTest));
        return const RemoveWatchlistTvs(tvsDetailTest).props;
      },
    );

    blocTest<WatchlistTvsBloc, WatchlistTvsState>(
      'should throw failure message status when failed to remove TV series from watchlist',
      build: () {
        when(mockRemoveTvsWatchlist.execute(tvsDetailTest)).thenAnswer(
            (_) async =>
                const Left(DatabaseFailure('can\'t add data to watchlist')));
        return watchlistTvsBloc;
      },
      act: (bloc) => bloc.add(const RemoveWatchlistTvs(tvsDetailTest)),
      expect: () => [
        const WatchlistTvsError('can\'t add data to watchlist'),
      ],
      verify: (bloc) {
        verify(mockRemoveTvsWatchlist.execute(tvsDetailTest));
        return const RemoveWatchlistTvs(tvsDetailTest).props;
      },
    );
  });
}
