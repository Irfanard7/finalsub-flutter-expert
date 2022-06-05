import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart';

abstract class TvsRepository {
  Future<Either<Failure, List<Tvs>>> getNowPlayingTvs();
  Future<Either<Failure, List<Tvs>>> getPopularTvs();
  Future<Either<Failure, List<Tvs>>> getTopRatedTvs();
  Future<Either<Failure, TvsDetail>> getTvsDetail(int id);
  Future<Either<Failure, List<Tvs>>> getTvsRecommendations(int id);
  Future<Either<Failure, List<Tvs>>> searchTvs(String query);
  Future<Either<Failure, List<Tvs>>> getWatchlistTvs();
  Future<Either<Failure, String>> saveWatchlist(TvsDetail tvs);
  Future<Either<Failure, String>> removeWatchlist(TvsDetail tvs);
  Future<bool> isAddedToWatchlist(int id);
}
