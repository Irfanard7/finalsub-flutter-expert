// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvsRepositoryImpl tvsRepository;
  late MockTvsRemoteDataSource mockTvsRemoteDataSource;
  late MockTvsLocalDataSource mockTvsLocalDataSource;

  setUp(() {
    mockTvsRemoteDataSource = MockTvsRemoteDataSource();
    mockTvsLocalDataSource = MockTvsLocalDataSource();
    tvsRepository = TvsRepositoryImpl(
      remoteDataSource: mockTvsRemoteDataSource,
      localDataSource: mockTvsLocalDataSource,
    );
  });

  final modelTvsTest = TvsModel(
    backdropPath: '/mUkuc2wyV9dHLG0D0Loaw5pO2s8.jpg',
    genreIds: const [10765, 10759, 18],
    id: 1399,
    originalName: 'Game of Thrones',
    overview:
        "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    popularity: 29.780826,
    posterPath: '/jIhL6mlT7AblhbHJgEoiBIOUVl1.jpg',
    firstAirDate: '2011-04-17',
    name: 'Game of Thrones',
    voteAverage: 7.91,
    voteCount: 1172,
  );

  final tvsTest = Tvs(
    backdropPath: '/mUkuc2wyV9dHLG0D0Loaw5pO2s8.jpg',
    genreIds: const [10765, 10759, 18],
    id: 1399,
    originalName: 'Game of Thrones',
    overview:
        "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    popularity: 29.780826,
    posterPath: '/jIhL6mlT7AblhbHJgEoiBIOUVl1.jpg',
    firstAirDate: '2011-04-17',
    name: 'Game of Thrones',
    voteAverage: 7.91,
    voteCount: 1172,
  );

  final tvsModelListTest = <TvsModel>[modelTvsTest];
  final tvsListTest = <Tvs>[tvsTest];

  group('Now Playing TV series', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getNowPlayingTvs())
          .thenAnswer((_) async => tvsModelListTest);
      // act
      final result = await tvsRepository.getNowPlayingTvs();
      // assert
      verify(mockTvsRemoteDataSource.getNowPlayingTvs());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tvsListTest);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getNowPlayingTvs())
          .thenThrow(ServerException());
      // act
      final result = await tvsRepository.getNowPlayingTvs();
      // assert
      verify(mockTvsRemoteDataSource.getNowPlayingTvs());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getNowPlayingTvs())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvsRepository.getNowPlayingTvs();
      // assert
      verify(mockTvsRemoteDataSource.getNowPlayingTvs());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular TV series', () {
    test('should return TV series list when call to data source is success',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getPopularTvs())
          .thenAnswer((_) async => tvsModelListTest);
      // act
      final result = await tvsRepository.getPopularTvs();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tvsListTest);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getPopularTvs())
          .thenThrow(ServerException());
      // act
      final result = await tvsRepository.getPopularTvs();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getPopularTvs())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvsRepository.getPopularTvs();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated TV series', () {
    test('should return TV series list when call to data source is successful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTopRatedTvs())
          .thenAnswer((_) async => tvsModelListTest);
      // act
      final result = await tvsRepository.getTopRatedTvs();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tvsListTest);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTopRatedTvs())
          .thenThrow(ServerException());
      // act
      final result = await tvsRepository.getTopRatedTvs();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTopRatedTvs())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvsRepository.getTopRatedTvs();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get TV series detail', () {
    const idTest = 5;
    final tvsResponseTest = TvsDetailResponse(
      backdropPath: 'backdropPath',
      genres: const [GenreModel(id: 1, name: 'Action')],
      id: 1,
      overview: 'overview',
      posterPath: 'posterPath',
      firstAirDate: 'firstAirDate',
      name: 'name',
      voteAverage: 1,
      voteCount: 1,
      adult: false,
    );

    test(
        'should return TV series detail data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTvsDetail(idTest))
          .thenAnswer((_) async => tvsResponseTest);
      // act
      final result = await tvsRepository.getTvsDetail(idTest);
      // assert
      verify(mockTvsRemoteDataSource.getTvsDetail(idTest));
      expect(result, equals(Right(tvsDetailTest)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTvsDetail(idTest))
          .thenThrow(ServerException());
      // act
      final result = await tvsRepository.getTvsDetail(idTest);
      // assert
      verify(mockTvsRemoteDataSource.getTvsDetail(idTest));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTvsDetail(idTest))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvsRepository.getTvsDetail(idTest);
      // assert
      verify(mockTvsRemoteDataSource.getTvsDetail(idTest));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get TV series Recommendations', () {
    final tvsListTest = <TvsModel>[];
    const idTest = 1;

    test('should return TV series list data when the call is successful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTvsRecommendations(idTest))
          .thenAnswer((_) async => tvsListTest);
      // act
      final result = await tvsRepository.getTvsRecommendations(idTest);
      // assert
      verify(mockTvsRemoteDataSource.getTvsRecommendations(idTest));
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tvsListTest));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTvsRecommendations(idTest))
          .thenThrow(ServerException());
      // act
      final result = await tvsRepository.getTvsRecommendations(idTest);
      // assert
      verify(mockTvsRemoteDataSource.getTvsRecommendations(idTest));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.getTvsRecommendations(idTest))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvsRepository.getTvsRecommendations(idTest);
      // assert
      verify(mockTvsRemoteDataSource.getTvsRecommendations(idTest));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Search TV series data', () {
    const queryTest = 'spy x family';

    test('should return TV series list when call to data source is successful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.searchTvs(queryTest))
          .thenAnswer((_) async => tvsModelListTest);
      // act
      final result = await tvsRepository.searchTvs(queryTest);
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tvsListTest);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.searchTvs(queryTest))
          .thenThrow(ServerException());
      // act
      final result = await tvsRepository.searchTvs(queryTest);
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvsRemoteDataSource.searchTvs(queryTest))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvsRepository.searchTvs(queryTest);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist TV series', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockTvsLocalDataSource.insertWatchListTvs(testTvsTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await tvsRepository.saveWatchlist(tvsDetailTest);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return Database Failure when saving unsuccessful', () async {
      // arrange
      when(mockTvsLocalDataSource.insertWatchListTvs(testTvsTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await tvsRepository.saveWatchlist(tvsDetailTest);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist TV series', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockTvsLocalDataSource.removeWatchListTvs(testTvsTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await tvsRepository.removeWatchlist(tvsDetailTest);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return Database Failure when remove unsuccessful', () async {
      // arrange
      when(mockTvsLocalDataSource.removeWatchListTvs(testTvsTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await tvsRepository.removeWatchlist(tvsDetailTest);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist TV series status', () {
    test('should return TV series watch status whether data is found',
        () async {
      // arrange
      const idTest = 3;
      when(mockTvsLocalDataSource.getTvsById(idTest))
          .thenAnswer((_) async => null);
      // act
      final result = await tvsRepository.isAddedToWatchlist(idTest);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist TV series', () {
    test('should return list of TV series', () async {
      // arrange
      when(mockTvsLocalDataSource.getWatchListTvs())
          .thenAnswer((_) async => [testTvsTable]);
      // act
      final result = await tvsRepository.getWatchlistTvs();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [tvsWatchlistTest]);
    });
  });
}
