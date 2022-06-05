// Mocks generated by Mockito 5.2.0 from annotations
// in ditonton/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:convert' as _i25;
import 'dart:typed_data' as _i26;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i8;
import 'package:ditonton/data/datasources/db/database_helper_movie.dart'
    as _i15;
import 'package:ditonton/data/datasources/db/database_helper_tvs.dart' as _i24;
import 'package:ditonton/data/datasources/movie/movie_local_data_source.dart'
    as _i13;
import 'package:ditonton/data/datasources/movie/movie_remote_data_source.dart'
    as _i11;
import 'package:ditonton/data/datasources/tvs/tvs_local_data_source.dart'
    as _i22;
import 'package:ditonton/data/datasources/tvs/tvs_remote_data_source.dart'
    as _i20;
import 'package:ditonton/data/models/movie/movie_detail_model.dart' as _i3;
import 'package:ditonton/data/models/movie/movie_model.dart' as _i12;
import 'package:ditonton/data/models/movie/movie_table.dart' as _i14;
import 'package:ditonton/data/models/tvs/tvs_detail_model.dart' as _i4;
import 'package:ditonton/data/models/tvs/tvs_model.dart' as _i21;
import 'package:ditonton/data/models/tvs/tvs_table.dart' as _i23;
import 'package:ditonton/domain/entities/movie/movie.dart' as _i9;
import 'package:ditonton/domain/entities/movie/movie_detail.dart' as _i10;
import 'package:ditonton/domain/entities/tvs/tvs.dart' as _i18;
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart' as _i19;
import 'package:ditonton/domain/repositories/movie_repository.dart' as _i6;
import 'package:ditonton/domain/repositories/tvs_repository.dart' as _i17;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeMovieDetailResponse_1 extends _i1.Fake
    implements _i3.MovieDetailResponse {}

class _FakeTvsDetailResponse_2 extends _i1.Fake
    implements _i4.TvsDetailResponse {}

class _FakeResponse_3 extends _i1.Fake implements _i5.Response {}

class _FakeStreamedResponse_4 extends _i1.Fake implements _i5.StreamedResponse {
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i6.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i2.Either<_i8.Failure, _i10.MovieDetail>>.value(
              _FakeEither_0<_i8.Failure, _i10.MovieDetail>())) as _i7
          .Future<_i2.Either<_i8.Failure, _i10.MovieDetail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlist(
          _i10.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlist(
          _i10.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i11.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i12.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
              returnValue:
                  Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]))
          as _i7.Future<List<_i12.MovieModel>>);
  @override
  _i7.Future<List<_i12.MovieModel>> getPopularMovies() => (super.noSuchMethod(
          Invocation.method(#getPopularMovies, []),
          returnValue: Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]))
      as _i7.Future<List<_i12.MovieModel>>);
  @override
  _i7.Future<List<_i12.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
          Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]))
      as _i7.Future<List<_i12.MovieModel>>);
  @override
  _i7.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: Future<_i3.MovieDetailResponse>.value(
                  _FakeMovieDetailResponse_1()))
          as _i7.Future<_i3.MovieDetailResponse>);
  @override
  _i7.Future<List<_i12.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]))
          as _i7.Future<List<_i12.MovieModel>>);
  @override
  _i7.Future<List<_i12.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]))
          as _i7.Future<List<_i12.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i13.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i14.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i14.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i14.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<_i14.MovieTable?>.value())
          as _i7.Future<_i14.MovieTable?>);
  @override
  _i7.Future<List<_i14.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
          Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<_i14.MovieTable>>.value(<_i14.MovieTable>[]))
      as _i7.Future<List<_i14.MovieTable>>);
}

/// A class which mocks [DatabaseHelperMovie].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperMovie extends _i1.Mock
    implements _i15.DatabaseHelperMovie {
  MockDatabaseHelperMovie() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i16.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i16.Database?>.value())
          as _i7.Future<_i16.Database?>);
  @override
  _i7.Future<int> insertWatchlistMovie(_i14.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistMovie, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlistMovie(_i14.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistMovie, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [TvsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvsRepository extends _i1.Mock implements _i17.TvsRepository {
  MockTvsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>> getNowPlayingTvs() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTvs, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>.value(
              _FakeEither_0<_i8.Failure, List<_i18.Tvs>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>> getPopularTvs() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvs, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>.value(
              _FakeEither_0<_i8.Failure, List<_i18.Tvs>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>> getTopRatedTvs() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTvs, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>.value(
              _FakeEither_0<_i8.Failure, List<_i18.Tvs>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i19.TvsDetail>> getTvsDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvsDetail, [id]),
          returnValue: Future<_i2.Either<_i8.Failure, _i19.TvsDetail>>.value(
              _FakeEither_0<_i8.Failure, _i19.TvsDetail>())) as _i7
          .Future<_i2.Either<_i8.Failure, _i19.TvsDetail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>> getTvsRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvsRecommendations, [id]),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>.value(
              _FakeEither_0<_i8.Failure, List<_i18.Tvs>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>> searchTvs(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvs, [query]),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>.value(
              _FakeEither_0<_i8.Failure, List<_i18.Tvs>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>> getWatchlistTvs() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvs, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>.value(
              _FakeEither_0<_i8.Failure, List<_i18.Tvs>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i18.Tvs>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlist(
          _i19.TvsDetail? tvs) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [tvs]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlist(
          _i19.TvsDetail? tvs) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [tvs]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
}

/// A class which mocks [TvsRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvsRemoteDataSource extends _i1.Mock
    implements _i20.TvsRemoteDataSource {
  MockTvsRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i21.TvsModel>> getNowPlayingTvs() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTvs, []),
              returnValue: Future<List<_i21.TvsModel>>.value(<_i21.TvsModel>[]))
          as _i7.Future<List<_i21.TvsModel>>);
  @override
  _i7.Future<List<_i21.TvsModel>> getPopularTvs() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvs, []),
              returnValue: Future<List<_i21.TvsModel>>.value(<_i21.TvsModel>[]))
          as _i7.Future<List<_i21.TvsModel>>);
  @override
  _i7.Future<List<_i21.TvsModel>> getTopRatedTvs() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTvs, []),
              returnValue: Future<List<_i21.TvsModel>>.value(<_i21.TvsModel>[]))
          as _i7.Future<List<_i21.TvsModel>>);
  @override
  _i7.Future<List<_i21.TvsModel>> getTvsRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvsRecommendations, [id]),
              returnValue: Future<List<_i21.TvsModel>>.value(<_i21.TvsModel>[]))
          as _i7.Future<List<_i21.TvsModel>>);
  @override
  _i7.Future<List<_i21.TvsModel>> searchTvs(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvs, [query]),
              returnValue: Future<List<_i21.TvsModel>>.value(<_i21.TvsModel>[]))
          as _i7.Future<List<_i21.TvsModel>>);
  @override
  _i7.Future<_i4.TvsDetailResponse> getTvsDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvsDetail, [id]),
              returnValue: Future<_i4.TvsDetailResponse>.value(
                  _FakeTvsDetailResponse_2()))
          as _i7.Future<_i4.TvsDetailResponse>);
}

/// A class which mocks [TvsLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvsLocalDataSource extends _i1.Mock
    implements _i22.TvsLocalDataSource {
  MockTvsLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchListTvs(_i23.TvsTable? tvs) =>
      (super.noSuchMethod(Invocation.method(#insertWatchListTvs, [tvs]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchListTvs(_i23.TvsTable? tvs) =>
      (super.noSuchMethod(Invocation.method(#removeWatchListTvs, [tvs]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i23.TvsTable?> getTvsById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvsById, [id]),
              returnValue: Future<_i23.TvsTable?>.value())
          as _i7.Future<_i23.TvsTable?>);
  @override
  _i7.Future<List<_i23.TvsTable>> getWatchListTvs() =>
      (super.noSuchMethod(Invocation.method(#getWatchListTvs, []),
              returnValue: Future<List<_i23.TvsTable>>.value(<_i23.TvsTable>[]))
          as _i7.Future<List<_i23.TvsTable>>);
}

/// A class which mocks [DatabaseHelperTvs].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTvs extends _i1.Mock implements _i24.DatabaseHelperTvs {
  MockDatabaseHelperTvs() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i16.Database?> get databaseTvs =>
      (super.noSuchMethod(Invocation.getter(#databaseTvs),
              returnValue: Future<_i16.Database?>.value())
          as _i7.Future<_i16.Database?>);
  @override
  _i7.Future<int> insertWatchlistTvs(_i23.TvsTable? tvs) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTvs, [tvs]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlistTvs(_i23.TvsTable? tvs) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTvs, [tvs]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getTvsById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvsById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistTvs() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvs, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i26.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i26.Uint8List>.value(_i26.Uint8List(0)))
          as _i7.Future<_i26.Uint8List>);
  @override
  _i7.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4()))
          as _i7.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}