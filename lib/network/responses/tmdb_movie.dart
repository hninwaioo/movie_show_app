library core;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_show_app/network/responses/tmdb_genre.dart';

part 'tmdb_movie.freezed.dart';
part 'tmdb_movie.g.dart';

@freezed
class TMDBMovie with _$TMDBMovie {
  factory TMDBMovie(

      @JsonKey(name: 'adult') bool? adult,

    @JsonKey(name: 'backdrop_path') String? backdropPath,

    @JsonKey(name: 'genre_ids') List<int>? genreIds,

      @JsonKey(name: 'id') int? id,

    @JsonKey(name: 'original_language') String? originalLanguage,

    @JsonKey(name: 'original_title') String? originalTitle,

      @JsonKey(name: 'overview') String? overview,
      @JsonKey(name: 'popularity') double? popularity,

    @JsonKey(name: 'poster_path') String? posterPath,

    @JsonKey(name: 'release_date') String? releaseDate,

    // required
      @JsonKey(name: 'title') String? title,

      @JsonKey(name: 'video') bool? video,

      // @Default(false) bool video,

    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,

    @JsonKey(name: 'genres') List<TMDBGenres>? genres,



  ) = _TMDBMovieBasic;

  factory TMDBMovie.fromJson(Map<String, dynamic> json) =>
      _$TMDBMovieFromJson(json);
}
