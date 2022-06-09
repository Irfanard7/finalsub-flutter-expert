import 'package:equatable/equatable.dart';
import 'package:tvseries/domain/entities/tvs.dart';
import 'package:tvseries/domain/entities/tvs_detail.dart';

class TvsTable extends Equatable {
  final int id;
  final String? name;
  final String? posterPath;
  final String? overview;

  const TvsTable({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview,
  });

  factory TvsTable.fromEntity(TvsDetail tvs) => TvsTable(
        id: tvs.id,
        name: tvs.name,
        posterPath: tvs.posterPath,
        overview: tvs.overview,
      );

  factory TvsTable.fromMap(Map<String, dynamic> map) => TvsTable(
        id: map['id'],
        name: map['name'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'posterPath': posterPath,
        'overview': overview,
      };

  Tvs toEntity() => Tvs.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: name,
      );

  @override
  List<Object?> get props => [id, name, posterPath, overview];
}
