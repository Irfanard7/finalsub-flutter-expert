import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tvs/remove_tvs_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_tvs_objects.dart';
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
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await tvsUsecase.execute(tvsDetailTest);
    // assert
    verify(mockTvsRepository.removeWatchlist(tvsDetailTest));
    expect(result, Right('Removed from watchlist'));
  });
}
