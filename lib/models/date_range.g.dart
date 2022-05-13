// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DateRange> _$dateRangeSerializer = new _$DateRangeSerializer();

class _$DateRangeSerializer implements StructuredSerializer<DateRange> {
  @override
  final Iterable<Type> types = const [DateRange, _$DateRange];
  @override
  final String wireName = 'DateRange';

  @override
  Iterable<Object?> serialize(Serializers serializers, DateRange object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'maximum',
      serializers.serialize(object.maximum,
          specifiedType: const FullType(String)),
      'minimum',
      serializers.serialize(object.minimum,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DateRange deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DateRangeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DateRange extends DateRange {
  @override
  final String maximum;
  @override
  final String minimum;

  factory _$DateRange([void Function(DateRangeBuilder)? updates]) =>
      (new DateRangeBuilder()..update(updates)).build();

  _$DateRange._({required this.maximum, required this.minimum}) : super._() {
    BuiltValueNullFieldError.checkNotNull(maximum, 'DateRange', 'maximum');
    BuiltValueNullFieldError.checkNotNull(minimum, 'DateRange', 'minimum');
  }

  @override
  DateRange rebuild(void Function(DateRangeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DateRangeBuilder toBuilder() => new DateRangeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateRange &&
        maximum == other.maximum &&
        minimum == other.minimum;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, maximum.hashCode), minimum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DateRange')
          ..add('maximum', maximum)
          ..add('minimum', minimum))
        .toString();
  }
}

class DateRangeBuilder implements Builder<DateRange, DateRangeBuilder> {
  _$DateRange? _$v;

  String? _maximum;
  String? get maximum => _$this._maximum;
  set maximum(String? maximum) => _$this._maximum = maximum;

  String? _minimum;
  String? get minimum => _$this._minimum;
  set minimum(String? minimum) => _$this._minimum = minimum;

  DateRangeBuilder();

  DateRangeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _maximum = $v.maximum;
      _minimum = $v.minimum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateRange other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DateRange;
  }

  @override
  void update(void Function(DateRangeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DateRange build() {
    final _$result = _$v ??
        new _$DateRange._(
            maximum: BuiltValueNullFieldError.checkNotNull(
                maximum, 'DateRange', 'maximum'),
            minimum: BuiltValueNullFieldError.checkNotNull(
                minimum, 'DateRange', 'minimum'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
