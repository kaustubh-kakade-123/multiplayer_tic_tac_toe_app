import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_model_built.g.dart';

abstract class UserModelBuilt
    implements Built<UserModelBuilt, UserModelBuiltBuilder> {
  String get id;
  String get email;
  String get displayName;
  String? get photoUrl;
  int get wins;
  int get losses;
  int get draws;
  DateTime get createdAt;
  DateTime get lastSeen;

  UserModelBuilt._();
  factory UserModelBuilt([void Function(UserModelBuiltBuilder) updates]) =
      _$UserModelBuilt;

  static Serializer<UserModelBuilt> get serializer =>
      _$userModelBuiltSerializer;
}
