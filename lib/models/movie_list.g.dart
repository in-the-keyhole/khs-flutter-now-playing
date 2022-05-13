// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MovieList> _$movieListSerializer = new _$MovieListSerializer();

class _$MovieListSerializer implements StructuredSerializer<MovieList> {
  @override
  final Iterable<Type> types = const [MovieList, _$MovieList];
  @override
  final String wireName = 'MovieList';

  @override
  Iterable<Object?> serialize(Serializers serializers, MovieList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'dates',
      serializers.serialize(object.dates,
          specifiedType: const FullType(DateRange)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Movie)])),
      'total_pages',
      serializers.serialize(object.totalPages,
          specifiedType: const FullType(int)),
      'total_results',
      serializers.serialize(object.totalResults,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MovieList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dates':
          result.dates.replace(serializers.deserialize(value,
              specifiedType: const FullType(DateRange))! as DateRange);
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))!
              as BuiltList<Object?>);
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'total_results':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieList extends MovieList {
  @override
  final DateRange dates;
  @override
  final int page;
  @override
  final BuiltList<Movie> results;
  @override
  final int totalPages;
  @override
  final int totalResults;

  factory _$MovieList([void Function(MovieListBuilder)? updates]) =>
      (new MovieListBuilder()..update(updates)).build();

  _$MovieList._(
      {required this.dates,
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(dates, 'MovieList', 'dates');
    BuiltValueNullFieldError.checkNotNull(page, 'MovieList', 'page');
    BuiltValueNullFieldError.checkNotNull(results, 'MovieList', 'results');
    BuiltValueNullFieldError.checkNotNull(
        totalPages, 'MovieList', 'totalPages');
    BuiltValueNullFieldError.checkNotNull(
        totalResults, 'MovieList', 'totalResults');
  }

  @override
  MovieList rebuild(void Function(MovieListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieListBuilder toBuilder() => new MovieListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieList &&
        dates == other.dates &&
        page == other.page &&
        results == other.results &&
        totalPages == other.totalPages &&
        totalResults == other.totalResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, dates.hashCode), page.hashCode), results.hashCode),
            totalPages.hashCode),
        totalResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieList')
          ..add('dates', dates)
          ..add('page', page)
          ..add('results', results)
          ..add('totalPages', totalPages)
          ..add('totalResults', totalResults))
        .toString();
  }
}

class MovieListBuilder implements Builder<MovieList, MovieListBuilder> {
  _$MovieList? _$v;

  DateRangeBuilder? _dates;
  DateRangeBuilder get dates => _$this._dates ??= new DateRangeBuilder();
  set dates(DateRangeBuilder? dates) => _$this._dates = dates;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  ListBuilder<Movie>? _results;
  ListBuilder<Movie> get results =>
      _$this._results ??= new ListBuilder<Movie>();
  set results(ListBuilder<Movie>? results) => _$this._results = results;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  int? _totalResults;
  int? get totalResults => _$this._totalResults;
  set totalResults(int? totalResults) => _$this._totalResults = totalResults;

  MovieListBuilder();

  MovieListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dates = $v.dates.toBuilder();
      _page = $v.page;
      _results = $v.results.toBuilder();
      _totalPages = $v.totalPages;
      _totalResults = $v.totalResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieList;
  }

  @override
  void update(void Function(MovieListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieList build() {
    _$MovieList _$result;
    try {
      _$result = _$v ??
          new _$MovieList._(
              dates: dates.build(),
              page: BuiltValueNullFieldError.checkNotNull(
                  page, 'MovieList', 'page'),
              results: results.build(),
              totalPages: BuiltValueNullFieldError.checkNotNull(
                  totalPages, 'MovieList', 'totalPages'),
              totalResults: BuiltValueNullFieldError.checkNotNull(
                  totalResults, 'MovieList', 'totalResults'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dates';
        dates.build();

        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
