// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return _GameModel.fromJson(json);
}

/// @nodoc
mixin _$GameModel {
  String get id => throw _privateConstructorUsedError;
  String get player1Id => throw _privateConstructorUsedError;
  String? get player2Id => throw _privateConstructorUsedError;
  String get player1Name => throw _privateConstructorUsedError;
  String? get player2Name => throw _privateConstructorUsedError;
  List<List<String>> get board =>
      throw _privateConstructorUsedError; // 3x3 board
  Player get currentTurn => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  String? get winnerId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  int get moveCount => throw _privateConstructorUsedError;

  /// Serializes this GameModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameModelCopyWith<GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res, GameModel>;
  @useResult
  $Res call({
    String id,
    String player1Id,
    String? player2Id,
    String player1Name,
    String? player2Name,
    List<List<String>> board,
    Player currentTurn,
    GameStatus status,
    String? winnerId,
    DateTime createdAt,
    DateTime? completedAt,
    int moveCount,
  });
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res, $Val extends GameModel>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player1Id = null,
    Object? player2Id = freezed,
    Object? player1Name = null,
    Object? player2Name = freezed,
    Object? board = null,
    Object? currentTurn = null,
    Object? status = null,
    Object? winnerId = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? moveCount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            player1Id: null == player1Id
                ? _value.player1Id
                : player1Id // ignore: cast_nullable_to_non_nullable
                      as String,
            player2Id: freezed == player2Id
                ? _value.player2Id
                : player2Id // ignore: cast_nullable_to_non_nullable
                      as String?,
            player1Name: null == player1Name
                ? _value.player1Name
                : player1Name // ignore: cast_nullable_to_non_nullable
                      as String,
            player2Name: freezed == player2Name
                ? _value.player2Name
                : player2Name // ignore: cast_nullable_to_non_nullable
                      as String?,
            board: null == board
                ? _value.board
                : board // ignore: cast_nullable_to_non_nullable
                      as List<List<String>>,
            currentTurn: null == currentTurn
                ? _value.currentTurn
                : currentTurn // ignore: cast_nullable_to_non_nullable
                      as Player,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as GameStatus,
            winnerId: freezed == winnerId
                ? _value.winnerId
                : winnerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            moveCount: null == moveCount
                ? _value.moveCount
                : moveCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameModelImplCopyWith<$Res>
    implements $GameModelCopyWith<$Res> {
  factory _$$GameModelImplCopyWith(
    _$GameModelImpl value,
    $Res Function(_$GameModelImpl) then,
  ) = __$$GameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String player1Id,
    String? player2Id,
    String player1Name,
    String? player2Name,
    List<List<String>> board,
    Player currentTurn,
    GameStatus status,
    String? winnerId,
    DateTime createdAt,
    DateTime? completedAt,
    int moveCount,
  });
}

/// @nodoc
class __$$GameModelImplCopyWithImpl<$Res>
    extends _$GameModelCopyWithImpl<$Res, _$GameModelImpl>
    implements _$$GameModelImplCopyWith<$Res> {
  __$$GameModelImplCopyWithImpl(
    _$GameModelImpl _value,
    $Res Function(_$GameModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player1Id = null,
    Object? player2Id = freezed,
    Object? player1Name = null,
    Object? player2Name = freezed,
    Object? board = null,
    Object? currentTurn = null,
    Object? status = null,
    Object? winnerId = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? moveCount = null,
  }) {
    return _then(
      _$GameModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        player1Id: null == player1Id
            ? _value.player1Id
            : player1Id // ignore: cast_nullable_to_non_nullable
                  as String,
        player2Id: freezed == player2Id
            ? _value.player2Id
            : player2Id // ignore: cast_nullable_to_non_nullable
                  as String?,
        player1Name: null == player1Name
            ? _value.player1Name
            : player1Name // ignore: cast_nullable_to_non_nullable
                  as String,
        player2Name: freezed == player2Name
            ? _value.player2Name
            : player2Name // ignore: cast_nullable_to_non_nullable
                  as String?,
        board: null == board
            ? _value._board
            : board // ignore: cast_nullable_to_non_nullable
                  as List<List<String>>,
        currentTurn: null == currentTurn
            ? _value.currentTurn
            : currentTurn // ignore: cast_nullable_to_non_nullable
                  as Player,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as GameStatus,
        winnerId: freezed == winnerId
            ? _value.winnerId
            : winnerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        moveCount: null == moveCount
            ? _value.moveCount
            : moveCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameModelImpl implements _GameModel {
  const _$GameModelImpl({
    required this.id,
    required this.player1Id,
    this.player2Id,
    required this.player1Name,
    this.player2Name,
    required final List<List<String>> board,
    required this.currentTurn,
    required this.status,
    this.winnerId,
    required this.createdAt,
    this.completedAt,
    required this.moveCount,
  }) : _board = board;

  factory _$GameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameModelImplFromJson(json);

  @override
  final String id;
  @override
  final String player1Id;
  @override
  final String? player2Id;
  @override
  final String player1Name;
  @override
  final String? player2Name;
  final List<List<String>> _board;
  @override
  List<List<String>> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  // 3x3 board
  @override
  final Player currentTurn;
  @override
  final GameStatus status;
  @override
  final String? winnerId;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;
  @override
  final int moveCount;

  @override
  String toString() {
    return 'GameModel(id: $id, player1Id: $player1Id, player2Id: $player2Id, player1Name: $player1Name, player2Name: $player2Name, board: $board, currentTurn: $currentTurn, status: $status, winnerId: $winnerId, createdAt: $createdAt, completedAt: $completedAt, moveCount: $moveCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.player1Id, player1Id) ||
                other.player1Id == player1Id) &&
            (identical(other.player2Id, player2Id) ||
                other.player2Id == player2Id) &&
            (identical(other.player1Name, player1Name) ||
                other.player1Name == player1Name) &&
            (identical(other.player2Name, player2Name) ||
                other.player2Name == player2Name) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            (identical(other.currentTurn, currentTurn) ||
                other.currentTurn == currentTurn) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.winnerId, winnerId) ||
                other.winnerId == winnerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.moveCount, moveCount) ||
                other.moveCount == moveCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    player1Id,
    player2Id,
    player1Name,
    player2Name,
    const DeepCollectionEquality().hash(_board),
    currentTurn,
    status,
    winnerId,
    createdAt,
    completedAt,
    moveCount,
  );

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      __$$GameModelImplCopyWithImpl<_$GameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameModelImplToJson(this);
  }
}

abstract class _GameModel implements GameModel {
  const factory _GameModel({
    required final String id,
    required final String player1Id,
    final String? player2Id,
    required final String player1Name,
    final String? player2Name,
    required final List<List<String>> board,
    required final Player currentTurn,
    required final GameStatus status,
    final String? winnerId,
    required final DateTime createdAt,
    final DateTime? completedAt,
    required final int moveCount,
  }) = _$GameModelImpl;

  factory _GameModel.fromJson(Map<String, dynamic> json) =
      _$GameModelImpl.fromJson;

  @override
  String get id;
  @override
  String get player1Id;
  @override
  String? get player2Id;
  @override
  String get player1Name;
  @override
  String? get player2Name;
  @override
  List<List<String>> get board; // 3x3 board
  @override
  Player get currentTurn;
  @override
  GameStatus get status;
  @override
  String? get winnerId;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  int get moveCount;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
