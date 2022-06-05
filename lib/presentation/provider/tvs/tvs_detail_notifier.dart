import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart';
import 'package:ditonton/domain/usecases/tvs/get_tvs_detail.dart';
import 'package:ditonton/domain/usecases/tvs/get_tvs_recommendations.dart';
import 'package:ditonton/domain/usecases/tvs/get_watchlist_tvs_status.dart';
import 'package:ditonton/domain/usecases/tvs/remove_tvs_watchlist.dart';
import 'package:ditonton/domain/usecases/tvs/save_tvs_watchlist.dart';
import 'package:flutter/material.dart';

class TvsDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvsDetail getTvsDetail;
  final GetTvsRecommendations getTvsRecommendations;
  final GetWatchlistTvsStatus getWatchlistTvsStatus;
  final SaveTvsWatchlist saveTvsWatchlist;
  final RemoveTvsWatchlist removeTvsWatchlist;

  TvsDetailNotifier({
    required this.getTvsDetail,
    required this.getTvsRecommendations,
    required this.getWatchlistTvsStatus,
    required this.saveTvsWatchlist,
    required this.removeTvsWatchlist,
  });

  late TvsDetail _tvs;
  TvsDetail get tvs => _tvs;

  RequestState _tvsState = RequestState.Empty;
  RequestState get tvsState => _tvsState;

  List<Tvs> _tvsRecommendations = [];
  List<Tvs> get tvsRecommendations => _tvsRecommendations;

  RequestState _recommendationTvsState = RequestState.Empty;
  RequestState get recommendationTvsState => _recommendationTvsState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoTvsWatchlist = false;
  bool get isAddedToTvsWatchlist => _isAddedtoTvsWatchlist;

  Future<void> fetchTvsDetail(int id) async {
    _tvsState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTvsDetail.execute(id);
    final recommendationResult = await getTvsRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _tvsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvs) {
        _recommendationTvsState = RequestState.Loading;
        _tvs = tvs;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationTvsState = RequestState.Error;
            _message = failure.message;
          },
          (tvs) {
            _recommendationTvsState = RequestState.Loaded;
            _tvsRecommendations = tvs;
          },
        );
        _tvsState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _tvsWatchlistMessage = '';
  String get tvsWatchlistMessage => _tvsWatchlistMessage;

  Future<void> addTvsWatchlist(TvsDetail tvs) async {
    final result = await saveTvsWatchlist.execute(tvs);

    await result.fold(
      (failure) async {
        _tvsWatchlistMessage = failure.message;
      },
      (successMessage) async {
        _tvsWatchlistMessage = successMessage;
      },
    );

    await loadTvsWatchlistStatus(tvs.id);
  }

  Future<void> removeFromTvsWatchlist(TvsDetail tvs) async {
    final result = await removeTvsWatchlist.execute(tvs);

    await result.fold(
      (failure) async {
        _tvsWatchlistMessage = failure.message;
      },
      (successMessage) async {
        _tvsWatchlistMessage = successMessage;
      },
    );

    await loadTvsWatchlistStatus(tvs.id);
  }

  Future<void> loadTvsWatchlistStatus(int id) async {
    final result = await getWatchlistTvsStatus.execute(id);
    _isAddedtoTvsWatchlist = result;
    notifyListeners();
  }
}
