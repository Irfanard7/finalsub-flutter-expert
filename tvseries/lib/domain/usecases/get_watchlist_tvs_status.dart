import 'package:tvseries/tvseries.dart';

class GetWatchlistTvsStatus {
  final TvsRepository repository;

  GetWatchlistTvsStatus(this.repository);

  Future<bool> execute(int id) {
    return repository.isAddedToWatchlist(id);
  }
}
