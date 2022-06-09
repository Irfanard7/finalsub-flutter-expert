import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvs tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = GetWatchlistTvs(mockTvsRepository);
  });

  test('should get list of TV series from the repository', () async {
    // arrange
    when(mockTvsRepository.getWatchlistTvs())
        .thenAnswer((_) async => Right(tvsTestList));
    // act
    final result = await tvsUsecase.execute();
    // assert
    expect(result, Right(tvsTestList));
  });
}
