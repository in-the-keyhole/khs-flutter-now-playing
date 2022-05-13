import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'date_range.g.dart';

abstract class DateRange implements Built<DateRange, DateRangeBuilder> {
  static Serializer<DateRange> get serializer => _$dateRangeSerializer;

  String get maximum;

  String get minimum;

  DateRange._();
  factory DateRange([void Function(DateRangeBuilder) updates]) = _$DateRange;
}