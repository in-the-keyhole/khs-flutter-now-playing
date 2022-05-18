import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  static Serializer<Movie> get serializer => _$movieSerializer;

  bool get adult;

  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  int get id;

  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  String get overview;

  double get popularity;

  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  String get title;

  bool get video;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  int? get rating;

  Movie._();
  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;
}
