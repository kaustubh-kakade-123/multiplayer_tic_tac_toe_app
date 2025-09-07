// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MoveModel _$MoveModelFromJson(Map<String, dynamic> json) {
  return _MoveModel.fromJson(json);
}

/// @nodoc
mixin _$MoveModel {
  String get gameId => throw _privateConstructorUsedError;
  String get playerId => throw _privateConstructorUsedError;
  int get row => throw _privateConstructorUsedError;
  int get col => throw _privateConstructorUsedError;
  Player get player => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this MoveModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoveModelCopyWith<MoveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveModelCopyWith<$Res> {
  factory $MoveModelCopyWith(MoveModel value, $Res Function(MoveModel) then) =
      _$MoveModelCopyWithImpl<$Res, MoveModel>;
  @useResult
  $Res call({
    String gameId,
    String playerId,
    int row,
    int col,
    Player player,
    DateTime timestamp,
  });
}

/// @nodoc
class _$MoveModelCopyWithImpl<$Res, $Val extends MoveModel>
    implements $MoveModelCopyWith<$Res> {
  _$MoveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? playerId = null,
    Object? row = null,
    Object? col = null,
    Object? player = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            gameId: null == gameId
                ? _value.gameId
                : gameId // ignore: cast_nullable_to_non_nullable
                      as String,
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as String,
            row: null == row
                ? _value.row
                : row // ignore: cast_nullable_to_non_nullable
                      as int,
            col: null == col
                ? _value.col
                : col // ignore: cast_nullable_to_non_nullable
                      as int,
            player: null == player
                ? _value.player
                : player // ignore: cast_nullable_to_non_nullable
                      as Player,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MoveModelImplCopyWith<$Res>
    implements $MoveModelCopyWith<$Res> {
  factory _$$MoveModelImplCopyWith(
    _$MoveModelImpl value,
    $Res Function(_$MoveModelImpl) then,
  ) = __$$MoveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String gameId,
    String playerId,
    int row,
    int col,
    Player player,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$MoveModelImplCopyWithImpl<$Res>
    extends _$MoveModelCopyWithImpl<$Res, _$MoveModelImpl>
    implements _$$MoveModelImplCopyWith<$Res> {
  __$$MoveModelImplCopyWithImpl(
    _$MoveModelImpl _value,
    $Res Function(_$MoveModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MoveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? playerId = null,
    Object? row = null,
    Object? col = null,
    Object? player = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$MoveModelImpl(
        gameId: null == gameId
            ? _value.gameId
            : gameId // ignore: cast_nullable_to_non_nullable
                  as String,
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        row: null == row
            ? _value.row
            : row // ignore: cast_nullable_to_non_nullable
                  as int,
        col: null == col
            ? _value.col
            : col // ignore: cast_nullable_to_non_nullable
                  as int,
        player: null == player
            ? _value.player
            : player // ignore: cast_nullable_to_non_nullable
                  as Player,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MoveModelImpl implements _MoveModel {
  const _$MoveModelImpl({
    required this.gameId,
    required this.playerId,
    required this.row,
    required this.col,
    required this.player,
    required this.timestamp,
  });

  factory _$MoveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoveModelImplFromJson(json);

  @override
  final String gameId;
  @override
  final String playerId;
  @override
  final int row;
  @override
  final int col;
  @override
  final Player player;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'MoveModel(gameId: $gameId, playerId: $playerId, row: $row, col: $col, player: $player, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoveModelImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.col, col) || other.col == col) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gameId, playerId, row, col, player, timestamp);

  /// Create a copy of MoveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoveModelImplCopyWith<_$MoveModelImpl> get copyWith =>
      __$$MoveModelImplCopyWithImpl<_$MoveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoveModelImplToJson(this);
  }
}

abstract class _MoveModel implements MoveModel {
  const factory _MoveModel({
    required final String gameId,
    required final String playerId,
    required final int row,
    required final int col,
    required final Player player,
    required final DateTime timestamp,
  }) = _$MoveModelImpl;

  factory _MoveModel.fromJson(Map<String, dynamic> json) =
      _$MoveModelImpl.fromJson;

  @override
  String get gameId;
  @override
  String get playerId;
  @override
  int get row;
  @override
  int get col;
  @override
  Player get player;
  @override
  DateTime get timestamp;

  /// Create a copy of MoveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoveModelImplCopyWith<_$MoveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
