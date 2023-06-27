import 'package:freezed_annotation/freezed_annotation.dart';
part 'popular_model.freezed.dart';
part 'popular_model.g.dart';


@freezed
class PopularModel with _$PopularModel {
  const factory PopularModel({
    @JsonKey(name: 'poster_path')String? posterImage,
    @JsonKey(name: 'backdrop_path')String? backdropImage,
    @JsonKey(name: 'original_title')String? originalTitle,
    @JsonKey(name: 'vote_average')double? rating,
    String? overview,
    String? title,
  }) = _PopularModel;

  factory PopularModel.fromJson(Map<String, dynamic> json) =>
      _$PopularModelFromJson(json);
}
