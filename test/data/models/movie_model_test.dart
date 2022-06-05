import 'package:ditonton/data/models/movie/movie_model.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final modelMovieTest = MovieModel(
    adult: false,
    backdropPath: 'iniBackdropPath',
    genreIds: [12, 23, 34],
    id: 218,
    originalTitle: 'pokoknyaIniTitlenya',
    overview: 'apapunYangPentingIniOverview',
    popularity: 200.9,
    posterPath: 'lohIniposterPath',
    releaseDate: 'masaIyainireleaseDate',
    title: 'titleNihBos',
    video: false,
    voteAverage: 9.7,
    voteCount: 1000,
  );

  final movieTest = Movie(
    adult: false,
    backdropPath: 'iniBackdropPath',
    genreIds: [12, 23, 34],
    id: 218,
    originalTitle: 'pokoknyaIniTitlenya',
    overview: 'apapunYangPentingIniOverview',
    popularity: 200.9,
    posterPath: 'lohIniposterPath',
    releaseDate: 'masaIyainireleaseDate',
    title: 'titleNihBos',
    video: false,
    voteAverage: 9.7,
    voteCount: 1000,
  );

  test('should be a subclass of Movie entity', () async {
    final result = modelMovieTest.toEntity();
    expect(result, movieTest);
  });
}
