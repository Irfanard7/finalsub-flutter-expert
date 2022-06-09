import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late DetailTvsBloc detailTvsBloc;
  late MockGetTvsDetail mockGetTvsDetail;

  setUp(() {
    mockGetTvsDetail = MockGetTvsDetail();
    detailTvsBloc = DetailTvsBloc(mockGetTvsDetail);
  });

  const idTest = 1;
  test("DetailMovieBloc initial state should be empty", () {
    expect(detailTvsBloc.state, TvsDetailEmpty());
  });

  group('Detail movie test', () {
    blocTest<DetailTvsBloc, TvsState>(
      'Should emit [Loading, HasData] when TV series detail data is fetched successfully',
      build: () {
        when(mockGetTvsDetail.execute(idTest))
            .thenAnswer((_) async => const Right(tvsDetailTest));
        return detailTvsBloc;
      },
      act: (bloc) => bloc.add(const DetailTvs(idTest)),
      expect: () => [TvsDetailLoading(), const TvsDetailHasData(tvsDetailTest)],
      verify: (bloc) {
        verify(mockGetTvsDetail.execute(idTest));
      },
    );

    blocTest<DetailTvsBloc, TvsState>(
      'Should emit [Loading, Error] when detail movie data is failed to fetch',
      build: () {
        when(mockGetTvsDetail.execute(idTest)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return detailTvsBloc;
      },
      act: (bloc) => bloc.add(const DetailTvs(idTest)),
      expect: () =>
          [TvsDetailLoading(), const TvsDetailError('Server Failure')],
      verify: (bloc) {
        verify(mockGetTvsDetail.execute(idTest));
      },
    );
  });
}
