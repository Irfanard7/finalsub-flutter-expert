import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search/search.dart';
import 'package:tvseries/tvseries.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvs searchTvs;
  late MockTvsRepository mockTvsRepository;

  setUp(() {
    mockTvsRepository = MockTvsRepository();
    searchTvs = SearchTvs(mockTvsRepository);
  });

  final movieTest = <Tvs>[];
  const queryTest = 'Spy X Family';
  test('should get list of TV series from the repository', () async {
    // arrange
    when(mockTvsRepository.searchTvs(queryTest))
        .thenAnswer((_) async => Right(movieTest));
    // act
    final result = await searchTvs.execute(queryTest);
    // assert
    expect(result, Right(movieTest));
  });
}
