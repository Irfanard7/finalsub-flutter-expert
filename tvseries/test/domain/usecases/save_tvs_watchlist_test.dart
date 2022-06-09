import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveTvsWatchlist tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = SaveTvsWatchlist(mockTvsRepository);
  });

  test('should save watchlist TV series to repository', () async {
    // arrange
    when(mockTvsRepository.saveWatchlist(tvsDetailTest))
        .thenAnswer((_) async => const Right('Added from watchlist'));
    // act
    final result = await tvsUsecase.execute(tvsDetailTest);
    // assert
    verify(mockTvsRepository.saveWatchlist(tvsDetailTest));
    expect(result, const Right('Added from watchlist'));
  });
}
