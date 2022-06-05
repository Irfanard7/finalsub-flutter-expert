import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tvs/tvs_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvsLocalDataSourceImpl dataSource;
  late MockDatabaseHelperTvs mockDatabaseHelperTvs;

  setUp(() {
    mockDatabaseHelperTvs = MockDatabaseHelperTvs();
    dataSource =
        TvsLocalDataSourceImpl(databaseHelperTvs: mockDatabaseHelperTvs);
  });

  group('save watchlist Tvs', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelperTvs.insertWatchlistTvs(testTvsTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchListTvs(testTvsTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperTvs.insertWatchlistTvs(testTvsTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchListTvs(testTvsTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist Tvs', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelperTvs.removeWatchlistTvs(testTvsTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchListTvs(testTvsTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperTvs.removeWatchlistTvs(testTvsTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchListTvs(testTvsTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tvs Detail By Id', () {
    final tvsId = 23;

    test('should return Tvs Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelperTvs.getTvsById(tvsId))
          .thenAnswer((_) async => testTvsMap);
      // act
      final result = await dataSource.getTvsById(tvsId);
      // assert
      expect(result, testTvsTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelperTvs.getTvsById(tvsId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvsById(tvsId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist Tvs', () {
    test('should return list of TvsTable from database', () async {
      // arrange
      when(mockDatabaseHelperTvs.getWatchlistTvs())
          .thenAnswer((_) async => [testTvsMap]);
      // act
      final result = await dataSource.getWatchListTvs();
      // assert
      expect(result, [testTvsTable]);
    });
  });
}
