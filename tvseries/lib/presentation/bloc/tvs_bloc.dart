import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/tvseries.dart';

part 'tvs_event.dart';
part 'tvs_state.dart';

//Now playing TV series
class NowPlayingTvsBloc extends Bloc<TvsEvent, TvsState> {
  final GetNowPlayingTvs _getNowPlayingTvs;

  NowPlayingTvsBloc(this._getNowPlayingTvs) : super(NowPlayingTvsEmpty()) {
    on<NowPlayingTvs>((event, emit) async {
      emit(NowPlayingTvsLoading());
      final result = await _getNowPlayingTvs.execute();

      result.fold((failure) => emit(NowPlayingTvsError(failure.message)),
          (result) => emit(NowPlayingTvsHasData(result)));
    });
  }
}

//Popular TV series
class PopularTvsBloc extends Bloc<TvsEvent, TvsState> {
  final GetPopularTvs _getPopularTvs;

  PopularTvsBloc(this._getPopularTvs) : super(PopularTvsEmpty()) {
    on<PopularTvs>((event, emit) async {
      emit(PopularTvsLoading());
      final result = await _getPopularTvs.execute();

      result.fold((failure) => emit(PopularTvsError(failure.message)),
          (result) => emit(PopularTvsHasData(result)));
    });
  }
}

//Top rated TV series
class TopRatedTvsBloc extends Bloc<TvsEvent, TvsState> {
  final GetTopRatedTvs _getTopRatedTvs;

  TopRatedTvsBloc(this._getTopRatedTvs) : super(TopRatedTvsEmpty()) {
    on<TopRatedTvs>((event, emit) async {
      emit(TopRatedTvsLoading());
      final result = await _getTopRatedTvs.execute();

      result.fold((failure) => emit(TopRatedTvsError(failure.message)),
          (result) => emit(TopRatedTvsHasData(result)));
    });
  }
}

//Detail TV series
class DetailTvsBloc extends Bloc<TvsEvent, TvsState> {
  final GetTvsDetail _getTvsDetail;

  DetailTvsBloc(this._getTvsDetail) : super(TvsDetailEmpty()) {
    on<DetailTvs>((event, emit) async {
      final id = event.id;

      emit(TvsDetailLoading());
      final result = await _getTvsDetail.execute(id);

      result.fold((failure) => emit(TvsDetailError(failure.message)),
          (result) => emit(TvsDetailHasData(result)));
    });
  }
}

//Watchlist TV series
class WatchlistTvsBloc extends Bloc<TvsEvent, WatchlistTvsState> {
  final GetWatchlistTvs getWatchlistTvs;
  final GetWatchlistTvsStatus getWatchlistTvsStatus;
  final RemoveTvsWatchlist removeTvsWatchlist;
  final SaveTvsWatchlist saveTvsWatchlist;

  WatchlistTvsBloc({
    required this.getWatchlistTvs,
    required this.getWatchlistTvsStatus,
    required this.removeTvsWatchlist,
    required this.saveTvsWatchlist,
  }) : super(WatchlistTvsEmpty()) {
    on<WatchlistTvsList>((event, emit) async {
      emit(WatchlistTvsLoading());

      final result = await getWatchlistTvs.execute();

      result.fold((failure) {
        emit(WatchlistTvsError(failure.message));
      }, (data) {
        emit(WatchlistTvsHasList(data));
      });
    });

    on<WatchlistStatusTvs>((event, emit) async {
      emit(WatchlistTvsLoading());
      final result = await getWatchlistTvsStatus.execute(event.id);

      emit(WatchlistTvsHasStatus(result));
    });

    on<AddWatchlistTvs>((event, emit) async {
      final tvs = event.tvsDetail;
      final result = await saveTvsWatchlist.execute(tvs);

      result.fold((failure) {
        emit(WatchlistTvsError(failure.message));
      }, (message) {
        emit(WatchlistTvsHasMessage(message));
      });
    });

    on<RemoveWatchlistTvs>((event, emit) async {
      final tvs = event.tvsDetail;

      final result = await removeTvsWatchlist.execute(tvs);

      result.fold((failure) {
        emit(WatchlistTvsError(failure.message));
      }, (message) {
        emit(WatchlistTvsHasMessage(message));
      });
    });
  }
}

//Recommendation TV series
class RecommendationTvsBloc extends Bloc<TvsEvent, TvsState> {
  final GetTvsRecommendations _getTvsRecommendations;

  RecommendationTvsBloc(this._getTvsRecommendations) : super(TvsRecomEmpty()) {
    on<RecommendationTvs>((event, emit) async {
      final id = event.id;

      emit(TvsRecomLoading());

      final result = await _getTvsRecommendations.execute(id);

      result.fold((failure) {
        emit(TvsRecomError(failure.message));
      }, (data) {
        emit(TvsRecomHasData(data));
      });
    });
  }
}
