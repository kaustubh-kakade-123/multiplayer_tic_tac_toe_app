import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

import 'user_model.dart';
import 'game_model.dart';
import 'move_model.dart';
import 'score_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  UserModel,
  GameModel,
  GameStatus,
  Player,
  MoveModel,
  // MoveModel's enum Player is already named Player in this file scope; ensure it's referenced
  // Note: built_value will generate serializers for both the enum and the model.
  ScoreModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()
          ..add(_DateTimeSerializer())
          // Builder factories for nested BuiltList types used by GameModel.board
          ..addBuilderFactory(
            const FullType(BuiltList, [
              FullType(BuiltList, [FullType(String)]),
            ]),
            () => ListBuilder<BuiltList<String>>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addPlugin(StandardJsonPlugin()))
        .build();

class _DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  @override
  final Iterable<Type> types = const [DateTime];

  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(
    Serializers serializers,
    DateTime dateTime, {
    FullType specifiedType = FullType.unspecified,
  }) {
    // Serialize as ISO8601 string (UTC) to be compatible with web and Firestore
    return dateTime.toUtc().toIso8601String();
  }

  @override
  DateTime deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    if (serialized is int) {
      // assume milliseconds since epoch
      return DateTime.fromMillisecondsSinceEpoch(
        serialized,
        isUtc: true,
      ).toLocal();
    }
    if (serialized is String) {
      // ISO8601 string
      return DateTime.parse(serialized).toLocal();
    }
    if (serialized is DateTime) {
      return serialized;
    }
    throw ArgumentError('Cannot deserialize DateTime from: $serialized');
  }
}
