import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveTvsWatchlist tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = RemoveTvsWatchlist(mockTvsRepository);
  });

  test('should remove watchlist TV series from repository', () async {
    // arrange
    when(mockTvsRepository.removeWatchlist(tvsDetailTest))
        .thenAnswer((_) async => const Right('Removed from watchlist'));
    // act
    final result = await tvsUsecase.execute(tvsDetailTest);
    // assert
    verify(mockTvsRepository.removeWatchlist(tvsDetailTest));
    expect(result, const Right('Removed from watchlist'));
  });
}
