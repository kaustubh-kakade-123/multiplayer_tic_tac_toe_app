// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScoreModel> _$scoreModelSerializer = _$ScoreModelSerializer();

class _$ScoreModelSerializer implements StructuredSerializer<ScoreModel> {
  @override
  final Iterable<Type> types = const [ScoreModel, _$ScoreModel];
  @override
  final String wireName = 'ScoreModel';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ScoreModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'userId',
      serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      ),
      'displayName',
      serializers.serialize(
        object.displayName,
        specifiedType: const FullType(String),
      ),
      'wins',
      serializers.serialize(object.wins, specifiedType: const FullType(int)),
      'losses',
      serializers.serialize(object.losses, specifiedType: const FullType(int)),
      'draws',
      serializers.serialize(object.draws, specifiedType: const FullType(int)),
      'totalGames',
      serializers.serialize(
        object.totalGames,
        specifiedType: const FullType(int),
      ),
      'winRate',
      serializers.serialize(
        object.winRate,
        specifiedType: const FullType(double),
      ),
    ];

    return result;
  }

  @override
  ScoreModel deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScoreModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'displayName':
          result.displayName =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'wins':
          result.wins =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'losses':
          result.losses =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'draws':
          result.draws =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'totalGames':
          result.totalGames =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'winRate':
          result.winRate =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
      }
    }

    return result.build();
  }
}

class _$ScoreModel extends ScoreModel {
  @override
  final String userId;
  @override
  final String displayName;
  @override
  final int wins;
  @override
  final int losses;
  @override
  final int draws;
  @override
  final int totalGames;
  @override
  final double winRate;

  factory _$ScoreModel([void Function(ScoreModelBuilder)? updates]) =>
      (ScoreModelBuilder()..update(updates))._build();

  _$ScoreModel._({
    required this.userId,
    required this.displayName,
    required this.wins,
    required this.losses,
    required this.draws,
    required this.totalGames,
    required this.winRate,
  }) : super._();
  @override
  ScoreModel rebuild(void Function(ScoreModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScoreModelBuilder toBuilder() => ScoreModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScoreModel &&
        userId == other.userId &&
        displayName == other.displayName &&
        wins == other.wins &&
        losses == other.losses &&
        draws == other.draws &&
        totalGames == other.totalGames &&
        winRate == other.winRate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, wins.hashCode);
    _$hash = $jc(_$hash, losses.hashCode);
    _$hash = $jc(_$hash, draws.hashCode);
    _$hash = $jc(_$hash, totalGames.hashCode);
    _$hash = $jc(_$hash, winRate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScoreModel')
          ..add('userId', userId)
          ..add('displayName', displayName)
          ..add('wins', wins)
          ..add('losses', losses)
          ..add('draws', draws)
          ..add('totalGames', totalGames)
          ..add('winRate', winRate))
        .toString();
  }
}

class ScoreModelBuilder implements Builder<ScoreModel, ScoreModelBuilder> {
  _$ScoreModel? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  int? _wins;
  int? get wins => _$this._wins;
  set wins(int? wins) => _$this._wins = wins;

  int? _losses;
  int? get losses => _$this._losses;
  set losses(int? losses) => _$this._losses = losses;

  int? _draws;
  int? get draws => _$this._draws;
  set draws(int? draws) => _$this._draws = draws;

  int? _totalGames;
  int? get totalGames => _$this._totalGames;
  set totalGames(int? totalGames) => _$this._totalGames = totalGames;

  double? _winRate;
  double? get winRate => _$this._winRate;
  set winRate(double? winRate) => _$this._winRate = winRate;

  ScoreModelBuilder();

  ScoreModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _displayName = $v.displayName;
      _wins = $v.wins;
      _losses = $v.losses;
      _draws = $v.draws;
      _totalGames = $v.totalGames;
      _winRate = $v.winRate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScoreModel other) {
    _$v = other as _$ScoreModel;
  }

  @override
  void update(void Function(ScoreModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScoreModel build() => _build();

  _$ScoreModel _build() {
    final _$result =
        _$v ??
        _$ScoreModel._(
          userId: BuiltValueNullFieldError.checkNotNull(
            userId,
            r'ScoreModel',
            'userId',
          ),
          displayName: BuiltValueNullFieldError.checkNotNull(
            displayName,
            r'ScoreModel',
            'displayName',
          ),
          wins: BuiltValueNullFieldError.checkNotNull(
            wins,
            r'ScoreModel',
            'wins',
          ),
          losses: BuiltValueNullFieldError.checkNotNull(
            losses,
            r'ScoreModel',
            'losses',
          ),
          draws: BuiltValueNullFieldError.checkNotNull(
            draws,
            r'ScoreModel',
            'draws',
          ),
          totalGames: BuiltValueNullFieldError.checkNotNull(
            totalGames,
            r'ScoreModel',
            'totalGames',
          ),
          winRate: BuiltValueNullFieldError.checkNotNull(
            winRate,
            r'ScoreModel',
            'winRate',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
