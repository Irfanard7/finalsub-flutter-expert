import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvsDetail tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = GetTvsDetail(mockTvsRepository);
  });

  const tId = 1;

  test('should get TV series detail from the repository', () async {
    // arrange
    when(mockTvsRepository.getTvsDetail(tId))
        .thenAnswer((_) async => const Right(tvsDetailTest));
    // act
    final result = await tvsUsecase.execute(tId);
    // assert
    expect(result, const Right(tvsDetailTest));
  });
}
