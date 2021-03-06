// Mocks generated by Mockito 5.2.0 from annotations
// in search/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:core/core.dart' as _i7;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie/movie.dart' as _i2;
import 'package:search/domain/usecase/search_movies.dart' as _i5;
import 'package:search/domain/usecase/search_tvs.dart' as _i8;
import 'package:tvseries/tvseries.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMovieRepository_0 extends _i1.Fake implements _i2.MovieRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

class _FakeTvsRepository_2 extends _i1.Fake implements _i4.TvsRepository {}

/// A class which mocks [SearchMovie].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchMovie extends _i1.Mock implements _i5.SearchMovie {
  MockSearchMovie() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_0()) as _i2.MovieRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> execute(String? query) =>
      (super.noSuchMethod(Invocation.method(#execute, [query]),
          returnValue: Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
              _FakeEither_1<_i7.Failure, List<_i2.Movie>>())) as _i6
          .Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
}

/// A class which mocks [SearchTvs].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchTvs extends _i1.Mock implements _i8.SearchTvs {
  MockSearchTvs() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvsRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvsRepository_2()) as _i4.TvsRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>> execute(String? query) =>
      (super.noSuchMethod(Invocation.method(#execute, [query]),
              returnValue: Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>.value(
                  _FakeEither_1<_i7.Failure, List<_i4.Tvs>>()))
          as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>);
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i2.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
              _FakeEither_1<_i7.Failure, List<_i2.Movie>>())) as _i6
          .Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
              _FakeEither_1<_i7.Failure, List<_i2.Movie>>())) as _i6
          .Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
              _FakeEither_1<_i7.Failure, List<_i2.Movie>>())) as _i6
          .Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, _i2.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i3.Either<_i7.Failure, _i2.MovieDetail>>.value(
              _FakeEither_1<_i7.Failure, _i2.MovieDetail>())) as _i6
          .Future<_i3.Either<_i7.Failure, _i2.MovieDetail>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
              _FakeEither_1<_i7.Failure, List<_i2.Movie>>())) as _i6
          .Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
              _FakeEither_1<_i7.Failure, List<_i2.Movie>>())) as _i6
          .Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> saveWatchlist(
          _i2.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: Future<_i3.Either<_i7.Failure, String>>.value(
                  _FakeEither_1<_i7.Failure, String>()))
          as _i6.Future<_i3.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> removeWatchlist(
          _i2.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: Future<_i3.Either<_i7.Failure, String>>.value(
                  _FakeEither_1<_i7.Failure, String>()))
          as _i6.Future<_i3.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i2.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>.value(
              _FakeEither_1<_i7.Failure, List<_i2.Movie>>())) as _i6
          .Future<_i3.Either<_i7.Failure, List<_i2.Movie>>>);
}

/// A class which mocks [TvsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvsRepository extends _i1.Mock implements _i4.TvsRepository {
  MockTvsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>> getNowPlayingTvs() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTvs, []),
              returnValue: Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>.value(
                  _FakeEither_1<_i7.Failure, List<_i4.Tvs>>()))
          as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>> getPopularTvs() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvs, []),
              returnValue: Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>.value(
                  _FakeEither_1<_i7.Failure, List<_i4.Tvs>>()))
          as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>> getTopRatedTvs() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTvs, []),
              returnValue: Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>.value(
                  _FakeEither_1<_i7.Failure, List<_i4.Tvs>>()))
          as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, _i4.TvsDetail>> getTvsDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvsDetail, [id]),
              returnValue: Future<_i3.Either<_i7.Failure, _i4.TvsDetail>>.value(
                  _FakeEither_1<_i7.Failure, _i4.TvsDetail>()))
          as _i6.Future<_i3.Either<_i7.Failure, _i4.TvsDetail>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>> getTvsRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvsRecommendations, [id]),
              returnValue: Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>.value(
                  _FakeEither_1<_i7.Failure, List<_i4.Tvs>>()))
          as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>> searchTvs(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvs, [query]),
              returnValue: Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>.value(
                  _FakeEither_1<_i7.Failure, List<_i4.Tvs>>()))
          as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>> getWatchlistTvs() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvs, []),
              returnValue: Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>.value(
                  _FakeEither_1<_i7.Failure, List<_i4.Tvs>>()))
          as _i6.Future<_i3.Either<_i7.Failure, List<_i4.Tvs>>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> saveWatchlist(
          _i4.TvsDetail? tvs) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [tvs]),
              returnValue: Future<_i3.Either<_i7.Failure, String>>.value(
                  _FakeEither_1<_i7.Failure, String>()))
          as _i6.Future<_i3.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i3.Either<_i7.Failure, String>> removeWatchlist(
          _i4.TvsDetail? tvs) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [tvs]),
              returnValue: Future<_i3.Either<_i7.Failure, String>>.value(
                  _FakeEither_1<_i7.Failure, String>()))
          as _i6.Future<_i3.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
}
