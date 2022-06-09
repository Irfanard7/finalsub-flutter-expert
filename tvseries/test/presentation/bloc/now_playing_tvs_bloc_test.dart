import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late NowPlayingTvsBloc nowPlayingTvsBloc;
  late MockGetNowPlayingTvs mockGetNowPlayingTvs;

  setUp(() {
    mockGetNowPlayingTvs = MockGetNowPlayingTvs();
    nowPlayingTvsBloc = NowPlayingTvsBloc(mockGetNowPlayingTvs);
  });

  test('NowPlayingTvsBloc initial state should be empty ', () {
    expect(nowPlayingTvsBloc.state, NowPlayingTvsEmpty());
  });

  group('Now playing TV series test', () {
    blocTest<NowPlayingTvsBloc, TvsState>(
        'should emits [Loading, HasData] when data is successfully fetched.',
        build: () {
          when(mockGetNowPlayingTvs.execute())
              .thenAnswer((_) async => Right(tvsTestList));
          return nowPlayingTvsBloc;
        },
        act: (bloc) => bloc.add(NowPlayingTvs()),
        expect: () => <TvsState>[
              NowPlayingTvsLoading(),
              NowPlayingTvsHasData(tvsTestList),
            ],
        verify: (bloc) {
          verify(mockGetNowPlayingTvs.execute());
          return NowPlayingTvs().props;
        });

    blocTest<NowPlayingTvsBloc, TvsState>(
      'should emits [Loading, Error] when now playing TV series data is failed to fetch',
      build: () {
        when(mockGetNowPlayingTvs.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return nowPlayingTvsBloc;
      },
      act: (bloc) => bloc.add(NowPlayingTvs()),
      expect: () => <TvsState>[
        NowPlayingTvsLoading(),
        const NowPlayingTvsError('Server Failure'),
      ],
      verify: (bloc) => NowPlayingTvsLoading(),
    );
  });
}
