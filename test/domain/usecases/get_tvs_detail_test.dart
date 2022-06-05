import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tvs/get_tvs_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvsDetail tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = GetTvsDetail(mockTvsRepository);
  });

  final tId = 1;

  test('should get TV series detail from the repository', () async {
    // arrange
    when(mockTvsRepository.getTvsDetail(tId))
        .thenAnswer((_) async => Right(tvsDetailTest));
    // act
    final result = await tvsUsecase.execute(tId);
    // assert
    expect(result, Right(tvsDetailTest));
  });
}