import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  @BuiltValueField(wireName: 'firstname')
  String get firstName;

  @BuiltValueField(wireName: 'lastname')
  String get lastName;

  String get token;

  String get username;

  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;
}
