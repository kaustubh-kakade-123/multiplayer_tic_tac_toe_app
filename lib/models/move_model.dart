// models/move_model.dart
import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';
import 'game_model.dart' show Player;

part 'move_model.g.dart';

// Reuse Player enum from game_model.dart

abstract class MoveModel implements Built<MoveModel, MoveModelBuilder> {
  String get gameId;
  String get playerId;
  int get row;
  int get col;
  Player get player;
  DateTime get timestamp;

  MoveModel._();
  factory MoveModel([void Function(MoveModelBuilder) updates]) = _$MoveModel;

  static Serializer<MoveModel> get serializer => _$moveModelSerializer;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(MoveModel.serializer, this)
          as Map<String, dynamic>;
  static MoveModel fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(MoveModel.serializer, json) as MoveModel;
  static MoveModel fromJsonString(String jsonString) =>
      fromJson(json.decode(jsonString) as Map<String, dynamic>);

  /// Compatibility factory (named params) to mirror previous Freezed usage
  factory MoveModel.create({
    required String gameId,
    required String playerId,
    required int row,
    required int col,
    required Player player,
    required DateTime timestamp,
  }) {
    return MoveModel(
      (b) => b
        ..gameId = gameId
        ..playerId = playerId
        ..row = row
        ..col = col
        ..player = player
        ..timestamp = timestamp,
    );
  }
}
