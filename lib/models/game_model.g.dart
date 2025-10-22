// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GameStatus _$waiting = const GameStatus._('waiting');
const GameStatus _$inProgress = const GameStatus._('inProgress');
const GameStatus _$completed = const GameStatus._('completed');
const GameStatus _$abandoned = const GameStatus._('abandoned');

GameStatus _$valueOf(String name) {
  switch (name) {
    case 'waiting':
      return _$waiting;
    case 'inProgress':
      return _$inProgress;
    case 'completed':
      return _$completed;
    case 'abandoned':
      return _$abandoned;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<GameStatus> _$values = BuiltSet<GameStatus>(const <GameStatus>[
  _$waiting,
  _$inProgress,
  _$completed,
  _$abandoned,
]);

const Player _$x = const Player._('x');
const Player _$o = const Player._('o');

Player _$playerValueOf(String name) {
  switch (name) {
    case 'x':
      return _$x;
    case 'o':
      return _$o;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<Player> _$playerValues = BuiltSet<Player>(const <Player>[
  _$x,
  _$o,
]);

Serializer<GameStatus> _$gameStatusSerializer = _$GameStatusSerializer();
Serializer<Player> _$playerSerializer = _$PlayerSerializer();
Serializer<GameModel> _$gameModelSerializer = _$GameModelSerializer();

class _$GameStatusSerializer implements PrimitiveSerializer<GameStatus> {
  @override
  final Iterable<Type> types = const <Type>[GameStatus];
  @override
  final String wireName = 'GameStatus';

  @override
  Object serialize(
    Serializers serializers,
    GameStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  GameStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => GameStatus.valueOf(serialized as String);
}

class _$PlayerSerializer implements PrimitiveSerializer<Player> {
  @override
  final Iterable<Type> types = const <Type>[Player];
  @override
  final String wireName = 'Player';

  @override
  Object serialize(
    Serializers serializers,
    Player object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  Player deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => Player.valueOf(serialized as String);
}

class _$GameModelSerializer implements StructuredSerializer<GameModel> {
  @override
  final Iterable<Type> types = const [GameModel, _$GameModel];
  @override
  final String wireName = 'GameModel';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GameModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'player1Id',
      serializers.serialize(
        object.player1Id,
        specifiedType: const FullType(String),
      ),
      'player1Name',
      serializers.serialize(
        object.player1Name,
        specifiedType: const FullType(String),
      ),
      'board',
      serializers.serialize(
        object.board,
        specifiedType: const FullType(BuiltList, const [
          const FullType(BuiltList, const [const FullType(String)]),
        ]),
      ),
      'currentTurn',
      serializers.serialize(
        object.currentTurn,
        specifiedType: const FullType(Player),
      ),
      'status',
      serializers.serialize(
        object.status,
        specifiedType: const FullType(GameStatus),
      ),
      'createdAt',
      serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      ),
      'moveCount',
      serializers.serialize(
        object.moveCount,
        specifiedType: const FullType(int),
      ),
    ];
    Object? value;
    value = object.player2Id;
    if (value != null) {
      result
        ..add('player2Id')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.player2Name;
    if (value != null) {
      result
        ..add('player2Name')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.winnerId;
    if (value != null) {
      result
        ..add('winnerId')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.completedAt;
    if (value != null) {
      result
        ..add('completedAt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(DateTime)),
        );
    }
    return result;
  }

  @override
  GameModel deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GameModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'player1Id':
          result.player1Id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'player2Id':
          result.player2Id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'player1Name':
          result.player1Name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'player2Name':
          result.player2Name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'board':
          result.board.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(BuiltList, const [const FullType(String)]),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'currentTurn':
          result.currentTurn =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Player),
                  )!
                  as Player;
          break;
        case 'status':
          result.status =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(GameStatus),
                  )!
                  as GameStatus;
          break;
        case 'winnerId':
          result.winnerId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'createdAt':
          result.createdAt =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )!
                  as DateTime;
          break;
        case 'completedAt':
          result.completedAt =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime?;
          break;
        case 'moveCount':
          result.moveCount =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GameModel extends GameModel {
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
  @override
  final BuiltList<BuiltList<String>> board;
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

  factory _$GameModel([void Function(GameModelBuilder)? updates]) =>
      (GameModelBuilder()..update(updates))._build();

  _$GameModel._({
    required this.id,
    required this.player1Id,
    this.player2Id,
    required this.player1Name,
    this.player2Name,
    required this.board,
    required this.currentTurn,
    required this.status,
    this.winnerId,
    required this.createdAt,
    this.completedAt,
    required this.moveCount,
  }) : super._();
  @override
  GameModel rebuild(void Function(GameModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameModelBuilder toBuilder() => GameModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameModel &&
        id == other.id &&
        player1Id == other.player1Id &&
        player2Id == other.player2Id &&
        player1Name == other.player1Name &&
        player2Name == other.player2Name &&
        board == other.board &&
        currentTurn == other.currentTurn &&
        status == other.status &&
        winnerId == other.winnerId &&
        createdAt == other.createdAt &&
        completedAt == other.completedAt &&
        moveCount == other.moveCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, player1Id.hashCode);
    _$hash = $jc(_$hash, player2Id.hashCode);
    _$hash = $jc(_$hash, player1Name.hashCode);
    _$hash = $jc(_$hash, player2Name.hashCode);
    _$hash = $jc(_$hash, board.hashCode);
    _$hash = $jc(_$hash, currentTurn.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, winnerId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, completedAt.hashCode);
    _$hash = $jc(_$hash, moveCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GameModel')
          ..add('id', id)
          ..add('player1Id', player1Id)
          ..add('player2Id', player2Id)
          ..add('player1Name', player1Name)
          ..add('player2Name', player2Name)
          ..add('board', board)
          ..add('currentTurn', currentTurn)
          ..add('status', status)
          ..add('winnerId', winnerId)
          ..add('createdAt', createdAt)
          ..add('completedAt', completedAt)
          ..add('moveCount', moveCount))
        .toString();
  }
}

class GameModelBuilder implements Builder<GameModel, GameModelBuilder> {
  _$GameModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _player1Id;
  String? get player1Id => _$this._player1Id;
  set player1Id(String? player1Id) => _$this._player1Id = player1Id;

  String? _player2Id;
  String? get player2Id => _$this._player2Id;
  set player2Id(String? player2Id) => _$this._player2Id = player2Id;

  String? _player1Name;
  String? get player1Name => _$this._player1Name;
  set player1Name(String? player1Name) => _$this._player1Name = player1Name;

  String? _player2Name;
  String? get player2Name => _$this._player2Name;
  set player2Name(String? player2Name) => _$this._player2Name = player2Name;

  ListBuilder<BuiltList<String>>? _board;
  ListBuilder<BuiltList<String>> get board =>
      _$this._board ??= ListBuilder<BuiltList<String>>();
  set board(ListBuilder<BuiltList<String>>? board) => _$this._board = board;

  Player? _currentTurn;
  Player? get currentTurn => _$this._currentTurn;
  set currentTurn(Player? currentTurn) => _$this._currentTurn = currentTurn;

  GameStatus? _status;
  GameStatus? get status => _$this._status;
  set status(GameStatus? status) => _$this._status = status;

  String? _winnerId;
  String? get winnerId => _$this._winnerId;
  set winnerId(String? winnerId) => _$this._winnerId = winnerId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _completedAt;
  DateTime? get completedAt => _$this._completedAt;
  set completedAt(DateTime? completedAt) => _$this._completedAt = completedAt;

  int? _moveCount;
  int? get moveCount => _$this._moveCount;
  set moveCount(int? moveCount) => _$this._moveCount = moveCount;

  GameModelBuilder();

  GameModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _player1Id = $v.player1Id;
      _player2Id = $v.player2Id;
      _player1Name = $v.player1Name;
      _player2Name = $v.player2Name;
      _board = $v.board.toBuilder();
      _currentTurn = $v.currentTurn;
      _status = $v.status;
      _winnerId = $v.winnerId;
      _createdAt = $v.createdAt;
      _completedAt = $v.completedAt;
      _moveCount = $v.moveCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameModel other) {
    _$v = other as _$GameModel;
  }

  @override
  void update(void Function(GameModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GameModel build() => _build();

  _$GameModel _build() {
    _$GameModel _$result;
    try {
      _$result =
          _$v ??
          _$GameModel._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'GameModel', 'id'),
            player1Id: BuiltValueNullFieldError.checkNotNull(
              player1Id,
              r'GameModel',
              'player1Id',
            ),
            player2Id: player2Id,
            player1Name: BuiltValueNullFieldError.checkNotNull(
              player1Name,
              r'GameModel',
              'player1Name',
            ),
            player2Name: player2Name,
            board: board.build(),
            currentTurn: BuiltValueNullFieldError.checkNotNull(
              currentTurn,
              r'GameModel',
              'currentTurn',
            ),
            status: BuiltValueNullFieldError.checkNotNull(
              status,
              r'GameModel',
              'status',
            ),
            winnerId: winnerId,
            createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt,
              r'GameModel',
              'createdAt',
            ),
            completedAt: completedAt,
            moveCount: BuiltValueNullFieldError.checkNotNull(
              moveCount,
              r'GameModel',
              'moveCount',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'board';
        board.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'GameModel',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
