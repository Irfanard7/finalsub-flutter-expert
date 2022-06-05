import 'package:ditonton/data/models/tvs/tvs_model.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final modelTvsTest = TvsModel(
    backdropPath: 'iniBackdropPathYa',
    genreIds: [7, 8, 9],
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
    genreIds: [7, 8, 9],
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
