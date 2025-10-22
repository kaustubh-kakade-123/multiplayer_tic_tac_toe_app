// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MoveModel> _$moveModelSerializer = _$MoveModelSerializer();

class _$MoveModelSerializer implements StructuredSerializer<MoveModel> {
  @override
  final Iterable<Type> types = const [MoveModel, _$MoveModel];
  @override
  final String wireName = 'MoveModel';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    MoveModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'gameId',
      serializers.serialize(
        object.gameId,
        specifiedType: const FullType(String),
      ),
      'playerId',
      serializers.serialize(
        object.playerId,
        specifiedType: const FullType(String),
      ),
      'row',
      serializers.serialize(object.row, specifiedType: const FullType(int)),
      'col',
      serializers.serialize(object.col, specifiedType: const FullType(int)),
      'player',
      serializers.serialize(
        object.player,
        specifiedType: const FullType(Player),
      ),
      'timestamp',
      serializers.serialize(
        object.timestamp,
        specifiedType: const FullType(DateTime),
      ),
    ];

    return result;
  }

  @override
  MoveModel deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MoveModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'gameId':
          result.gameId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'playerId':
          result.playerId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'row':
          result.row =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'col':
          result.col =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'player':
          result.player =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Player),
                  )!
                  as Player;
          break;
        case 'timestamp':
          result.timestamp =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )!
                  as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$MoveModel extends MoveModel {
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

  factory _$MoveModel([void Function(MoveModelBuilder)? updates]) =>
      (MoveModelBuilder()..update(updates))._build();

  _$MoveModel._({
    required this.gameId,
    required this.playerId,
    required this.row,
    required this.col,
    required this.player,
    required this.timestamp,
  }) : super._();
  @override
  MoveModel rebuild(void Function(MoveModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoveModelBuilder toBuilder() => MoveModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoveModel &&
        gameId == other.gameId &&
        playerId == other.playerId &&
        row == other.row &&
        col == other.col &&
        player == other.player &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, gameId.hashCode);
    _$hash = $jc(_$hash, playerId.hashCode);
    _$hash = $jc(_$hash, row.hashCode);
    _$hash = $jc(_$hash, col.hashCode);
    _$hash = $jc(_$hash, player.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MoveModel')
          ..add('gameId', gameId)
          ..add('playerId', playerId)
          ..add('row', row)
          ..add('col', col)
          ..add('player', player)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class MoveModelBuilder implements Builder<MoveModel, MoveModelBuilder> {
  _$MoveModel? _$v;

  String? _gameId;
  String? get gameId => _$this._gameId;
  set gameId(String? gameId) => _$this._gameId = gameId;

  String? _playerId;
  String? get playerId => _$this._playerId;
  set playerId(String? playerId) => _$this._playerId = playerId;

  int? _row;
  int? get row => _$this._row;
  set row(int? row) => _$this._row = row;

  int? _col;
  int? get col => _$this._col;
  set col(int? col) => _$this._col = col;

  Player? _player;
  Player? get player => _$this._player;
  set player(Player? player) => _$this._player = player;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  MoveModelBuilder();

  MoveModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gameId = $v.gameId;
      _playerId = $v.playerId;
      _row = $v.row;
      _col = $v.col;
      _player = $v.player;
      _timestamp = $v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoveModel other) {
    _$v = other as _$MoveModel;
  }

  @override
  void update(void Function(MoveModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MoveModel build() => _build();

  _$MoveModel _build() {
    final _$result =
        _$v ??
        _$MoveModel._(
          gameId: BuiltValueNullFieldError.checkNotNull(
            gameId,
            r'MoveModel',
            'gameId',
          ),
          playerId: BuiltValueNullFieldError.checkNotNull(
            playerId,
            r'MoveModel',
            'playerId',
          ),
          row: BuiltValueNullFieldError.checkNotNull(row, r'MoveModel', 'row'),
          col: BuiltValueNullFieldError.checkNotNull(col, r'MoveModel', 'col'),
          player: BuiltValueNullFieldError.checkNotNull(
            player,
            r'MoveModel',
            'player',
          ),
          timestamp: BuiltValueNullFieldError.checkNotNull(
            timestamp,
            r'MoveModel',
            'timestamp',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
