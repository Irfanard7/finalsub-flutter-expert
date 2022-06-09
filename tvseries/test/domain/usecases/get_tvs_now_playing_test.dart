import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetNowPlayingTvs tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = GetNowPlayingTvs(mockTvsRepository);
  });

  final tvsTest = <Tvs>[];

  test('should get list of TV series from the repository', () async {
    // arrange
    when(mockTvsRepository.getNowPlayingTvs())
        .thenAnswer((_) async => Right(tvsTest));
    // act
    final result = await tvsUsecase.execute();
    // assert
    expect(result, Right(tvsTest));
  });
}