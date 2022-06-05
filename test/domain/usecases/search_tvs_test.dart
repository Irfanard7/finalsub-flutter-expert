import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/usecases/tvs/search_tvs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvs tvsUsecase;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    tvsUsecase = SearchTvs(mockTvsRepository);
  });

  final tvsTest = <Tvs>[];
  final queryTest = 'Spy X Family';

  test('should get list of TV series from the repository', () async {
    // arrange
    when(mockTvsRepository.searchTvs(queryTest))
        .thenAnswer((_) async => Right(tvsTest));
    // act
    final result = await tvsUsecase.execute(queryTest);
    // assert
    expect(result, Right(tvsTest));
  });
}
