import 'package:freezed_annotation/freezed_annotation.dart';
part 'trending_model.freezed.dart';
part 'trending_model.g.dart';


@freezed
class TrendingModel with _$TrendingModel {
  const factory TrendingModel({
    @JsonKey(name: 'poster_path')String? posterImage,
    @JsonKey(name: 'backdrop_path')String? backdropImage,
    @JsonKey(name: 'original_title')String? originalTitle,
    @JsonKey(name: 'vote_average')double? rating,
    String? overview,
    String? title,
  }) = _TrendingModel;

  factory TrendingModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingModelFromJson(json);
}
