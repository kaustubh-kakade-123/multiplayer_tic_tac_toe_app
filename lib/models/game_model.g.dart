// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameModel _$GameModelFromJson(Map<String, dynamic> json) => _GameModel(
  id: json['id'] as String,
  player1Id: json['player1Id'] as String,
  player2Id: json['player2Id'] as String?,
  player1Name: json['player1Name'] as String,
  player2Name: json['player2Name'] as String?,
  board: (json['board'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  currentTurn: $enumDecode(_$PlayerEnumMap, json['currentTurn']),
  status: $enumDecode(_$GameStatusEnumMap, json['status']),
  winnerId: json['winnerId'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  moveCount: (json['moveCount'] as num).toInt(),
);

Map<String, dynamic> _$GameModelToJson(_GameModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player1Id': instance.player1Id,
      'player2Id': instance.player2Id,
      'player1Name': instance.player1Name,
      'player2Name': instance.player2Name,
      'board': instance.board,
      'currentTurn': _$PlayerEnumMap[instance.currentTurn]!,
      'status': _$GameStatusEnumMap[instance.status]!,
      'winnerId': instance.winnerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'moveCount': instance.moveCount,
    };

const _$PlayerEnumMap = {Player.x: 'x', Player.o: 'o'};

const _$GameStatusEnumMap = {
  GameStatus.waiting: 'waiting',
  GameStatus.inProgress: 'inProgress',
  GameStatus.completed: 'completed',
  GameStatus.abandoned: 'abandoned',
};
