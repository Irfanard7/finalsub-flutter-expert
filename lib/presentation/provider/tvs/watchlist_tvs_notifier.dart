import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/usecases/tvs/get_watchlist_tvs.dart';
import 'package:flutter/material.dart';

class WatchlistTvsNotifier extends ChangeNotifier {
  var _watchlistTvs = <Tvs>[];
  List<Tvs> get watchlistTvs => _watchlistTvs;

  var _watchlistTvsState = RequestState.Empty;
  RequestState get watchlistTvsState => _watchlistTvsState;

  String _message = '';
  String get message => _message;

  final GetWatchlistTvs getWatchlistTvs;

  WatchlistTvsNotifier({required this.getWatchlistTvs});

  Future<void> fetchWatchlistTvs() async {
    _watchlistTvsState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvs.execute();
    result.fold(
      (failure) {
        _watchlistTvsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvsData) {
        _watchlistTvsState = RequestState.Loaded;
        _watchlistTvs = tvsData;
        notifyListeners();
      },
    );
  }
}
