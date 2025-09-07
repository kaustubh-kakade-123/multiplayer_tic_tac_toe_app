// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoveModelImpl _$$MoveModelImplFromJson(Map<String, dynamic> json) =>
    _$MoveModelImpl(
      gameId: json['gameId'] as String,
      playerId: json['playerId'] as String,
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
      player: $enumDecode(_$PlayerEnumMap, json['player']),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$MoveModelImplToJson(_$MoveModelImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'playerId': instance.playerId,
      'row': instance.row,
      'col': instance.col,
      'player': _$PlayerEnumMap[instance.player]!,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$PlayerEnumMap = {Player.x: 'x', Player.o: 'o'};
