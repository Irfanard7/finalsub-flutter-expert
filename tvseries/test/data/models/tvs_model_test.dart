// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/tvseries.dart';

void main() {
  final modelTvsTest = TvsModel(
    backdropPath: 'iniBackdropPathYa',
    genreIds: const [7, 8, 9],
    id: 022,
    overview: 'apapunYangPentingIniOverview',
    popularity: 221.9,
    posterPath: 'lohIniposterPath',
    voteAverage: 9.7,
    voteCount: 1000,
    name: 'iniNamaLoh',
    firstAirDate: '25-05-2021',
    originalName: 'ingatIniOriginalName',
  );

  final tvsTest = Tvs(
    backdropPath: 'iniBackdropPathYa',
    genreIds: const [7, 8, 9],
    id: 022,
    overview: 'apapunYangPentingIniOverview',
    popularity: 221.9,
    posterPath: 'lohIniposterPath',
    voteAverage: 9.7,
    voteCount: 1000,
    name: 'iniNamaLoh',
    firstAirDate: '25-05-2021',
    originalName: 'ingatIniOriginalName',
  );

  test('should be a subclass of TV series entity', () async {
    final result = modelTvsTest.toEntity();
    expect(result, tvsTest);
  });
}
