import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:khs_flutter_web_now_playing/models/movie.dart';
import 'date_range.dart';

part 'movie_list.g.dart';

abstract class MovieList implements Built<MovieList, MovieListBuilder> {
  static Serializer<MovieList> get serializer => _$movieListSerializer;

  DateRange get dates;

  int get page;

  BuiltList<Movie> get results;

  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  MovieList._();
  factory MovieList([void Function(MovieListBuilder) updates]) = _$MovieList;
}
