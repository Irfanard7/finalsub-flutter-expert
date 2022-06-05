import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/usecases/tvs/get_now_playing_tvs.dart';
import 'package:ditonton/domain/usecases/tvs/get_popular_tvs.dart';
import 'package:ditonton/domain/usecases/tvs/get_top_rated_tvs.dart';
import 'package:flutter/material.dart';

class TvsListNotifier extends ChangeNotifier {
  var _nowPlayingTvs = <Tvs>[];
  List<Tvs> get nowPlayingTvs => _nowPlayingTvs;

  RequestState _nowPlayingTvsState = RequestState.Empty;
  RequestState get nowPlayingTvsState => _nowPlayingTvsState;

  var _popularTvs = <Tvs>[];
  List<Tvs> get popularTvs => _popularTvs;

  RequestState _popularTvsState = RequestState.Empty;
  RequestState get popularTvsState => _popularTvsState;

  var _topRatedTvs = <Tvs>[];
  List<Tvs> get topRatedTvs => _topRatedTvs;

  RequestState _topRatedTvsState = RequestState.Empty;
  RequestState get topRatedTvsState => _topRatedTvsState;

  String _message = '';
  String get message => _message;

  TvsListNotifier({
    required this.getNowPlayingTvs,
    required this.getPopularTvs,
    required this.getTopRatedTvs,
  });

  final GetNowPlayingTvs getNowPlayingTvs;
  final GetPopularTvs getPopularTvs;
  final GetTopRatedTvs getTopRatedTvs;

  Future<void> fetchNowPlayingTvs() async {
    _nowPlayingTvsState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvs.execute();
    result.fold(
      (failure) {
        _nowPlayingTvsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvsData) {
        _nowPlayingTvsState = RequestState.Loaded;
        _nowPlayingTvs = tvsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTvs() async {
    _popularTvsState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvs.execute();
    result.fold(
      (failure) {
        _popularTvsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvsData) {
        _popularTvsState = RequestState.Loaded;
        _popularTvs = tvsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTvs() async {
    _topRatedTvsState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvs.execute();
    result.fold(
      (failure) {
        _topRatedTvsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvsData) {
        _topRatedTvsState = RequestState.Loaded;
        _topRatedTvs = tvsData;
        notifyListeners();
      },
    );
  }
}
