import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTvs tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = GetPopularTvs(mockTvsRepository);
  });

  final tvsTest = <Tvs>[];

  group('Get Popular TV series Test', () {
    test(
        'should get list of TV series from the repository when execute function is called',
        () async {
      // arrange
      when(mockTvsRepository.getPopularTvs())
          .thenAnswer((_) async => Right(tvsTest));
      // act
      final result = await tvsUsecase.execute();
      // assert
      expect(result, Right(tvsTest));
    });
  });
}
