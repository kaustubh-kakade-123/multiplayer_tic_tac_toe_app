// models/score_model.dart
import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'score_model.g.dart';

abstract class ScoreModel implements Built<ScoreModel, ScoreModelBuilder> {
  String get userId;
  String get displayName;
  int get wins;
  int get losses;
  int get draws;
  int get totalGames;
  double get winRate;

  ScoreModel._();
  factory ScoreModel([void Function(ScoreModelBuilder) updates]) = _$ScoreModel;

  static Serializer<ScoreModel> get serializer => _$scoreModelSerializer;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ScoreModel.serializer, this)
          as Map<String, dynamic>;
  static ScoreModel fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ScoreModel.serializer, json) as ScoreModel;
  static ScoreModel fromJsonString(String jsonString) =>
      fromJson(json.decode(jsonString) as Map<String, dynamic>);

  /// Compatibility factory mirroring prior Freezed API
  factory ScoreModel.create({
    required String userId,
    required String displayName,
    required int wins,
    required int losses,
    required int draws,
    required int totalGames,
    required double winRate,
  }) {
    return ScoreModel(
      (b) => b
        ..userId = userId
        ..displayName = displayName
        ..wins = wins
        ..losses = losses
        ..draws = draws
        ..totalGames = totalGames
        ..winRate = winRate,
    );
  }
}
