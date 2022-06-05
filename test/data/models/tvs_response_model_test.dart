import 'dart:convert';

import 'package:ditonton/data/models/tvs/tvs_model.dart';
import 'package:ditonton/data/models/tvs/tvs_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final modelTvsTest = TvsModel(
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
    id: 1,
    originalName: "Original Name",
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    firstAirDate: "2010-06-08",
    name: "Name",
    voteAverage: 1.0,
    voteCount: 1,
  );
  final tvsResponseModelTest = TvsResponse(tvsList: <TvsModel>[modelTvsTest]);
  group('fromJson', () {
    test('should return a valid TV series model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/on_the_air_tvs.json'));
      // act
      final result = TvsResponse.fromJson(jsonMap);
      // assert
      expect(result, tvsResponseModelTest);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // act
      final result = tvsResponseModelTest.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2, 3, 4],
            "id": 1,
            "original_name": "Original Name",
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "first_air_date": "2010-06-08",
            "name": "Name",
            "vote_average": 1.0,
            "vote_count": 1
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
