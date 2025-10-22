import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  String get id;
  String get email;
  String get displayName;
  String? get photoUrl;
  int get wins;
  int get losses;
  int get draws;
  DateTime get createdAt;
  DateTime get lastSeen;

  UserModel._();
  factory UserModel([void Function(UserModelBuilder) updates]) = _$UserModel;

  static Serializer<UserModel> get serializer => _$userModelSerializer;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserModel.serializer, this)
        as Map<String, dynamic>;
  }

  /// Compatibility factory to construct UserModel using named parameters
  /// (replaces previous Freezed-style generated constructor).
  factory UserModel.create({
    required String id,
    required String email,
    required String displayName,
    String? photoUrl,
    required int wins,
    required int losses,
    required int draws,
    required DateTime createdAt,
    required DateTime lastSeen,
  }) {
    return UserModel(
      (b) => b
        ..id = id
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..wins = wins
        ..losses = losses
        ..draws = draws
        ..createdAt = createdAt
        ..lastSeen = lastSeen,
    );
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserModel.serializer, json) as UserModel;
  }

  static UserModel fromJsonString(String jsonString) {
    return fromJson(json.decode(jsonString) as Map<String, dynamic>);
  }
}
