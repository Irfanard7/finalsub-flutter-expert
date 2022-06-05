import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tvs/tvs_remote_data_source.dart';
import 'package:ditonton/data/models/tvs/tvs_detail_model.dart';
import 'package:ditonton/data/models/tvs/tvs_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TvsRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvsRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get On the Air TV series', () {
    final tTvsList = TvsResponse.fromJson(
            json.decode(readJson('dummy_data/on_the_air_tvs.json')))
        .tvsList;

    test('should return list of TV series Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/on_the_air_tvs.json'), 200));
      // act
      final result = await dataSource.getNowPlayingTvs();
      // assert
      expect(result, equals(tTvsList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getNowPlayingTvs();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular TV series', () {
    final tTvsList = TvsResponse.fromJson(
            json.decode(readJson('dummy_data/popular_tvs.json')))
        .tvsList;

    test('should return list of TV series when response is success (200)',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/popular_tvs.json'), 200));
      // act
      final result = await dataSource.getPopularTvs();
      // assert
      expect(result, tTvsList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getPopularTvs();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated TV series', () {
    final tTvsList = TvsResponse.fromJson(
            json.decode(readJson('dummy_data/top_rated_tvs.json')))
        .tvsList;

    test('should return list of TV series when response code is 200 ',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/top_rated_tvs.json'), 200));
      // act
      final result = await dataSource.getTopRatedTvs();
      // assert
      expect(result, tTvsList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTopRatedTvs();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get TV series detail', () {
    final tvsId = 100;
    final detailTvs = TvsDetailResponse.fromJson(
        json.decode(readJson('dummy_data/detail_tvs.json')));

    test('should return TV series detail when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tvsId?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/detail_tvs.json'), 200));
      // act
      final result = await dataSource.getTvsDetail(tvsId);
      // assert
      expect(result, equals(detailTvs));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tvsId?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTvsDetail(tvsId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get TV series recommendations', () {
    final tvsList = TvsResponse.fromJson(
            json.decode(readJson('dummy_data/recommendations_tvs.json')))
        .tvsList;
    final tId = 1;

    test('should return list of TV series Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/recommendations_tvs.json'), 200));
      // act
      final result = await dataSource.getTvsRecommendations(tId);
      // assert
      expect(result, equals(tvsList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTvsRecommendations(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search TV series', () {
    final tvsResult = TvsResponse.fromJson(
            json.decode(readJson('dummy_data/search_spy_x_family_tvs.json')))
        .tvsList;
    final tQuery = 'IniQuery';

    test('should return list of TV series when response code is 200', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/search_spy_x_family_tvs.json'), 200));
      // act
      final result = await dataSource.searchTvs(tQuery);
      // assert
      expect(result, tvsResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.searchTvs(tQuery);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
