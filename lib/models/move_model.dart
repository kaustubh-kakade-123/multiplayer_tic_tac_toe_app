// models/move_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_model.freezed.dart';
part 'move_model.g.dart';

@JsonEnum()
enum Player { x, o }

@freezed
class MoveModel with _$MoveModel {
  const factory MoveModel({
    required String gameId,
    required String playerId,
    required int row,
    required int col,
    required Player player,
    required DateTime timestamp,
  }) = _MoveModel;

  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);
}
