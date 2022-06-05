import 'package:ditonton/data/models/tvs/tvs_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart';

final testTvsTable = TvsTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvsMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};

final tvsDetailTest = TvsDetail(
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  firstAirDate: 'firstAirDate',
  name: 'name',
  voteAverage: 1,
  voteCount: 1,
  adult: false,
);

final tvsWatchlistTest = Tvs.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final tvsTest = Tvs(
    backdropPath: '/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg',
    genreIds: [18, 9648],
    id: 31917,
    originalName: 'Pretty Little Liars',
    overview:
        'Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.',
    popularity: 47.432451,
    posterPath: '/vC324sdfcS313vh9QXwijLIHPJp.jpg',
    firstAirDate: '2010-06-08',
    name: 'Pretty Little Liars',
    voteAverage: 5.04,
    voteCount: 133);

final tvsTestList = [tvsTest];
