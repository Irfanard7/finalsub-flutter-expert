import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tvseries/tvseries.dart';

@GenerateMocks([
  TvsRepository,
  TvsRemoteDataSource,
  TvsLocalDataSource,
  DatabaseHelperTvs,
  GetNowPlayingTvs,
  GetPopularTvs,
  GetTopRatedTvs,
  GetTvsRecommendations,
  GetTvsDetail,
  GetWatchlistTvs,
  GetWatchlistTvsStatus,
  RemoveTvsWatchlist,
  SaveTvsWatchlist,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}

// ..E = Event
// ..S = State

//Now playing tvs
class FakeNowPlayingTvsE extends Fake implements TvsEvent {}

class FakeNowPlayingTvsS extends Fake implements TvsState {}

class FakeNowPlayingTvsBloc extends MockBloc<TvsEvent, TvsState>
    implements NowPlayingTvsBloc {}

//Popular tvs
class FakePopularTvsE extends Fake implements TvsEvent {}

class FakePopularTvsS extends Fake implements TvsState {}

class FakePopularTvsBloc extends MockBloc<TvsEvent, TvsState>
    implements PopularTvsBloc {}

//Top rated tvs
class FakeTopRatedTvsE extends Fake implements TvsEvent {}

class FakeTopRatedTvsS extends Fake implements TvsState {}

class FakeTopRatedTvsBloc extends MockBloc<TvsEvent, TvsState>
    implements TopRatedTvsBloc {}

//Detail tvs
class FakeDetailTvsE extends Fake implements TvsEvent {}

class FakeDetailTvsS extends Fake implements TvsState {}

class FakeDetailTvsBloc extends MockBloc<TvsEvent, TvsState>
    implements DetailTvsBloc {}

//Recommendation tvs
class FakeRecommendationTvsE extends Fake implements TvsEvent {}

class FakeRecommendationTvsS extends Fake implements TvsState {}

class FakeRecommendationTvsBloc extends MockBloc<TvsEvent, TvsState>
    implements RecommendationTvsBloc {}

//Watchlist tvs
class FakeWatchlistTvsE extends Fake implements TvsEvent {}

class FakeWatchlistTvsS extends Fake implements TvsState {}

class FakeWatchlistTvsBloc extends MockBloc<TvsEvent, WatchlistTvsState>
    implements WatchlistTvsBloc {}
