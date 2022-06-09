import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class GetNowPlayingTvs {
  final TvsRepository repository;

  GetNowPlayingTvs(this.repository);

  Future<Either<Failure, List<Tvs>>> execute() {
    return repository.getNowPlayingTvs();
  }
}
