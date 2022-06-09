import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:movie/movie.dart';
import 'package:search/search.dart';
import 'package:tvseries/tvseries.dart';

final locator = GetIt.instance;

void init() {
  // Movie bloc♦
  locator.registerFactory(
    () => NowPlayingMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DetailMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieBloc(
      getWatchlistMovies: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => RecommendationMovieBloc(
      locator(),
    ),
  );

  // TV series bloc
  locator.registerFactory(
    () => NowPlayingTvsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DetailTvsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvsSearchBloc(locator()),
  );
  locator.registerFactory(
    () => WatchlistTvsBloc(
      getWatchlistTvsStatus: locator(),
      getWatchlistTvs: locator(),
      removeTvsWatchlist: locator(),
      saveTvsWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => RecommendationTvsBloc(
      locator(),
    ),
  );

  //movie use case
  locator.registerLazySingleton(() => GetNowPlayingMovie(locator()));
  locator.registerLazySingleton(() => GetPopularMovie(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovie(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovie(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  //tv series use case
  locator.registerLazySingleton(() => GetNowPlayingTvs(locator()));
  locator.registerLazySingleton(() => GetPopularTvs(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvs(locator()));
  locator.registerLazySingleton(() => GetTvsDetail(locator()));
  locator.registerLazySingleton(() => GetTvsRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvs(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvsStatus(locator()));
  locator.registerLazySingleton(() => SaveTvsWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTvsWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvs(locator()));

  //movie repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  //tv series repository
  locator.registerLazySingleton<TvsRepository>(
    () => TvsRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // movie data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  // tv series data sources
  locator.registerLazySingleton<TvsRemoteDataSource>(
      () => TvsRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvsLocalDataSource>(
      () => TvsLocalDataSourceImpl(databaseHelperTvs: locator()));

  // movie helper
  locator
      .registerLazySingleton<DatabaseHelperMovie>(() => DatabaseHelperMovie());

  //tv series helper
  locator.registerLazySingleton<DatabaseHelperTvs>(() => DatabaseHelperTvs());

  // external
  locator.registerLazySingleton(() => http.Client());
}
