import 'package:ditonton/data/datasources/db/database_helper_movie.dart';
import 'package:ditonton/data/datasources/db/database_helper_tvs.dart';
import 'package:ditonton/data/datasources/movie/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/movie/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tvs/tvs_local_data_source.dart';
import 'package:ditonton/data/datasources/tvs/tvs_remote_data_source.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tvs_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelperMovie,
  TvsRepository,
  TvsRemoteDataSource,
  TvsLocalDataSource,
  DatabaseHelperTvs,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}