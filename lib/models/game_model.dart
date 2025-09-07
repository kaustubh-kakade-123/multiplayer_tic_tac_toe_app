// models/game_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@JsonEnum()
enum GameStatus { waiting, inProgress, completed, abandoned }

@JsonEnum()
enum Player { x, o }

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required String id,
    required String player1Id,
    String? player2Id,
    required String player1Name,
    String? player2Name,
    required List<List<String>> board, // 3x3 board
    required Player currentTurn,
    required GameStatus status,
    String? winnerId,
    required DateTime createdAt,
    DateTime? completedAt,
    required int moveCount,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);
}
