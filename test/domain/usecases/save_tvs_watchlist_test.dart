import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tvs/remove_tvs_watchlist.dart';
import 'package:ditonton/domain/usecases/tvs/save_tvs_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_tvs_objects.dart';
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
        .thenAnswer((_) async => Right('Added from watchlist'));
    // act
    final result = await tvsUsecase.execute(tvsDetailTest);
    // assert
    verify(mockTvsRepository.saveWatchlist(tvsDetailTest));
    expect(result, Right('Added from watchlist'));
  });
}
