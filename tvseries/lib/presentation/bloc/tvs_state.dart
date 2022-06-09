part of 'tvs_bloc.dart';

abstract class TvsState extends Equatable {
  const TvsState();

  @override
  List<Object> get props => [];
}

abstract class WatchlistTvsState extends Equatable {
  const WatchlistTvsState();

  @override
  List<Object?> get props => [];
}

//Now playing TV series state
class NowPlayingTvsEmpty extends TvsState {}

class NowPlayingTvsLoading extends TvsState {}

class NowPlayingTvsError extends TvsState {
  final String message;

  const NowPlayingTvsError(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingTvsHasData extends TvsState {
  final List<Tvs> resultNowPlayingTvs;

  const NowPlayingTvsHasData(this.resultNowPlayingTvs);

  @override
  List<Object> get props => [resultNowPlayingTvs];
}

//Popular TV series state
class PopularTvsEmpty extends TvsState {}

class PopularTvsLoading extends TvsState {}

class PopularTvsError extends TvsState {
  final String message;

  const PopularTvsError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularTvsHasData extends TvsState {
  final List<Tvs> resultPopularTvs;

  const PopularTvsHasData(this.resultPopularTvs);

  @override
  List<Object> get props => [resultPopularTvs];
}

//Top rated TV series state
class TopRatedTvsEmpty extends TvsState {}

class TopRatedTvsLoading extends TvsState {}

class TopRatedTvsError extends TvsState {
  final String message;

  const TopRatedTvsError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedTvsHasData extends TvsState {
  final List<Tvs> resultTopRatedTvs;

  const TopRatedTvsHasData(this.resultTopRatedTvs);

  @override
  List<Object> get props => [resultTopRatedTvs];
}

//Detail TV series state
class TvsDetailEmpty extends TvsState {}

class TvsDetailLoading extends TvsState {}

class TvsDetailError extends TvsState {
  final String message;

  const TvsDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TvsDetailHasData extends TvsState {
  final TvsDetail tvsDetail;

  const TvsDetailHasData(this.tvsDetail);

  @override
  List<Object> get props => [tvsDetail];
}

//Watchlist TV series state
class WatchlistTvsEmpty extends WatchlistTvsState {}

class WatchlistTvsLoading extends WatchlistTvsState {}

class WatchlistTvsError extends WatchlistTvsState {
  final String message;

  const WatchlistTvsError(this.message);

  @override
  List<Object?> get props => [message];
}

class WatchlistTvsHasStatus extends WatchlistTvsState {
  final bool result;

  const WatchlistTvsHasStatus(this.result);

  @override
  List<Object?> get props => [result];
}

class WatchlistTvsHasMessage extends WatchlistTvsState {
  final String message;

  const WatchlistTvsHasMessage(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistTvsHasList extends WatchlistTvsState {
  final List<Tvs> tvs;

  const WatchlistTvsHasList(this.tvs);

  @override
  List<Object?> get props => [tvs];
}

//Recommendation TV series state
class TvsRecomEmpty extends TvsState {}

class TvsRecomLoading extends TvsState {}

class TvsRecomError extends TvsState {
  final String message;

  const TvsRecomError(this.message);

  @override
  List<Object> get props => [message];
}

class TvsRecomHasData extends TvsState {
  final List<Tvs> tvs;

  const TvsRecomHasData(this.tvs);

  @override
  List<Object> get props => [tvs];
}
