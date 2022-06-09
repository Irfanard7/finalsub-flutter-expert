import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movie/movie.dart';
import 'package:search/search.dart';
import 'package:tvseries/tvseries.dart';

@GenerateMocks([
  SearchMovie,
  SearchTvs,
  MovieRepository,
  TvsRepository,
])
void main() {}

// ..E = Event
// ..S = State

// Movie search
class FakeMovieSearchE extends Fake implements SearchEvent {}

class FakeMovieSearchS extends Fake implements SearchState {}

class FakeMovieSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements MovieSearchBloc {}

// Tvs search
class FakeTvsSearchE extends Fake implements SearchEvent {}

class FakeTvsSearchS extends Fake implements SearchState {}

class FaketTvsSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements TvsSearchBloc {}
