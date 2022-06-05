import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/usecases/tvs/search_tvs.dart';
import 'package:flutter/material.dart';

class TvsSearchNotifier extends ChangeNotifier {
  final SearchTvs searchTvs;

  TvsSearchNotifier({required this.searchTvs});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Tvs> _searchResult = [];
  List<Tvs> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvsSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchTvs.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvsData) {
        _searchResult = tvsData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
