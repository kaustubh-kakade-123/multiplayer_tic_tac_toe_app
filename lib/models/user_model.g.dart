// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  photoUrl: json['photoUrl'] as String?,
  wins: (json['wins'] as num).toInt(),
  losses: (json['losses'] as num).toInt(),
  draws: (json['draws'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastSeen: DateTime.parse(json['lastSeen'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'wins': instance.wins,
      'losses': instance.losses,
      'draws': instance.draws,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastSeen': instance.lastSeen.toIso8601String(),
    };
