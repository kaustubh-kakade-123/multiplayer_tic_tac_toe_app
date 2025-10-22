// models/game_model.dart
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'game_model.g.dart';

class GameStatus extends EnumClass {
  static const GameStatus waiting = _$waiting;
  static const GameStatus inProgress = _$inProgress;
  static const GameStatus completed = _$completed;
  static const GameStatus abandoned = _$abandoned;

  const GameStatus._(String name) : super(name);
  static BuiltSet<GameStatus> get values => _$values;
  static GameStatus valueOf(String name) => _$valueOf(name);
  static Serializer<GameStatus> get serializer => _$gameStatusSerializer;
}

class Player extends EnumClass {
  static const Player x = _$x;
  static const Player o = _$o;

  const Player._(String name) : super(name);
  static BuiltSet<Player> get values => _$playerValues;
  static Player valueOf(String name) => _$playerValueOf(name);
  static Serializer<Player> get serializer => _$playerSerializer;
}

abstract class GameModel implements Built<GameModel, GameModelBuilder> {
  String get id;
  String get player1Id;
  String? get player2Id;
  String get player1Name;
  String? get player2Name;
  BuiltList<BuiltList<String>> get board; // 3x3 board as nested BuiltList
  Player get currentTurn;
  GameStatus get status;
  String? get winnerId;
  DateTime get createdAt;
  DateTime? get completedAt;
  int get moveCount;

  GameModel._();
  factory GameModel([void Function(GameModelBuilder) updates]) = _$GameModel;

  static Serializer<GameModel> get serializer => _$gameModelSerializer;
  Map<String, dynamic> toJson() =>
      serializers.serializeWith(GameModel.serializer, this)
          as Map<String, dynamic>;
  static GameModel fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(GameModel.serializer, json) as GameModel;
  static GameModel fromJsonString(String jsonString) =>
      fromJson(json.decode(jsonString) as Map<String, dynamic>);

  /// Compatibility factory similar to previous Freezed constructor
  factory GameModel.create({
    required String id,
    required String player1Id,
    String? player2Id,
    required String player1Name,
    String? player2Name,
    required List<List<String>> board,
    required Player currentTurn,
    required GameStatus status,
    String? winnerId,
    required DateTime createdAt,
    DateTime? completedAt,
    required int moveCount,
  }) {
    // convert nested List<List<String>> to BuiltList<BuiltList<String>>
    final builtBoard = BuiltList<BuiltList<String>>(
      board.map((row) => BuiltList<String>(row)).toList(),
    );

    return GameModel(
      (b) => b
        ..id = id
        ..player1Id = player1Id
        ..player2Id = player2Id
        ..player1Name = player1Name
        ..player2Name = player2Name
        ..board.replace(builtBoard)
        ..currentTurn = currentTurn
        ..status = status
        ..winnerId = winnerId
        ..createdAt = createdAt
        ..completedAt = completedAt
        ..moveCount = moveCount,
    );
  }
}
