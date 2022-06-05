import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart';
import 'package:equatable/equatable.dart';

class TvsDetailResponse extends Equatable {
  const TvsDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.firstAirDate,
  });

  final bool? adult;
  final String backdropPath;
  final List<GenreModel> genres;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final String firstAirDate;

  factory TvsDetailResponse.fromJson(Map<String, dynamic> json) =>
      TvsDetailResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        firstAirDate: json['first_air_date'],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "name": name,
        "overview": overview,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "first_air_date": firstAirDate,
      };

  TvsDetail toEntity() {
    return TvsDetail(
      adult: adult!,
      backdropPath: backdropPath,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      id: id,
      name: name,
      overview: overview,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
      firstAirDate: firstAirDate,
    );
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        name,
        overview,
        posterPath,
        voteAverage,
        voteCount,
        firstAirDate,
      ];
}
