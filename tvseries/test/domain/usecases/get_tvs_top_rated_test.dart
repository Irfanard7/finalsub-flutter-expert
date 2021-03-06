import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedTvs tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = GetTopRatedTvs(mockTvsRepository);
  });

  final tvsTest = <Tvs>[];

  test('should get list of TV series from repository', () async {
    // arrange
    when(mockTvsRepository.getTopRatedTvs())
        .thenAnswer((_) async => Right(tvsTest));
    // act
    final result = await tvsUsecase.execute();
    // assert
    expect(result, Right(tvsTest));
  });
}
