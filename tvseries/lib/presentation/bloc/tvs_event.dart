part of 'tvs_bloc.dart';

abstract class TvsEvent extends Equatable {
  const TvsEvent();
}

//Now playing TV series
class NowPlayingTvs extends TvsEvent {
  @override
  List<Object> get props => [];
}

//Popular TV series
class PopularTvs extends TvsEvent {
  @override
  List<Object> get props => [];
}

//Top rated TV series
class TopRatedTvs extends TvsEvent {
  @override
  List<Object> get props => [];
}

//Detail TV series
class DetailTvs extends TvsEvent {
  final int id;

  const DetailTvs(this.id);

  @override
  List<Object> get props => [id];
}

//Watchlist TV series list
class WatchlistTvsList extends TvsEvent {
  @override
  List<Object> get props => [];
}

//Watchlist TV series status
class WatchlistStatusTvs extends TvsEvent {
  final int id;

  const WatchlistStatusTvs(this.id);

  @override
  List<Object> get props => [id];
}

//Remove TV series movie
class RemoveWatchlistTvs extends TvsEvent {
  final TvsDetail tvsDetail;

  const RemoveWatchlistTvs(this.tvsDetail);

  @override
  List<Object> get props => [tvsDetail];
}

//Add watchlist TV series
class AddWatchlistTvs extends TvsEvent {
  final TvsDetail tvsDetail;

  const AddWatchlistTvs(this.tvsDetail);

  @override
  List<Object> get props => [tvsDetail];
}

//Recommendation TV series
class RecommendationTvs extends TvsEvent {
  final int id;

  const RecommendationTvs(this.id);
  @override
  List<Object> get props => [id];
}
