import 'package:ditonton/domain/repositories/tvs_repository.dart';

class GetWatchlistTvsStatus {
  final TvsRepository repository;

  GetWatchlistTvsStatus(this.repository);

  Future<bool> execute(int id) {
    return repository.isAddedToWatchlist(id);
  }
}
