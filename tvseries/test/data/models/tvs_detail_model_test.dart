// ignore_for_file: unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/data/models/tvs_detail_model.dart';

void main() {
  const tvsDetailModelTest = TvsDetailResponse(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [],
    id: 1,
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
    voteAverage: 8.0,
    voteCount: 100,
    firstAirDate: '16-20-2019',
  );

  final tvsDetailTest = tvsDetailModelTest.toEntity();
  final tvsDetailJsonTest = tvsDetailModelTest.toJson();

  group('TV series detail model test', () {
    test('Should return a subclass og tvs detail model entity', () {
      final result = tvsDetailModelTest.toEntity();
      expect(result, tvsDetailTest);
    });
  });

  test('Should become a json data of tvs detail model', () {
    final result = tvsDetailModelTest.toJson();
    expect(result, tvsDetailJsonTest);
  });
}
