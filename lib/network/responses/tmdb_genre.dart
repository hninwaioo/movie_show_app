library core;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tmdb_genre.freezed.dart';
part 'tmdb_genre.g.dart';

@freezed
class TMDBGenres with _$TMDBGenres {
  factory TMDBGenres({
    @JsonKey(name: 'name') String? name,
    required int id,

  }) = _TMDBGenresBasic;

  factory TMDBGenres.fromJson(Map<String, dynamic> json) =>
      _$TMDBGenresFromJson(json);
}
