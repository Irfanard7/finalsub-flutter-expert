import 'package:ditonton/data/models/tvs/tvs_model.dart';
import 'package:equatable/equatable.dart';

class TvsResponse extends Equatable {
  final List<TvsModel> tvsList;

  TvsResponse({required this.tvsList});

  factory TvsResponse.fromJson(Map<String, dynamic> json) => TvsResponse(
        tvsList: List<TvsModel>.from((json["results"] as List)
            .map((x) => TvsModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tvsList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [tvsList];
}
