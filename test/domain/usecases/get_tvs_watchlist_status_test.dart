import 'package:ditonton/domain/usecases/tvs/get_watchlist_tvs_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvsStatus tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = GetWatchlistTvsStatus(mockTvsRepository);
  });

  test('should get watchlist TV series status from repository', () async {
    // arrange
    when(mockTvsRepository.isAddedToWatchlist(1))
        .thenAnswer((_) async => true);
    // act
    final result = await tvsUsecase.execute(1);
    // assert
    expect(result, true);
  });
}
