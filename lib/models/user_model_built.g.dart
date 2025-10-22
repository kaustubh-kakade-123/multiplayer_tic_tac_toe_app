// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_built.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserModelBuilt> _$userModelBuiltSerializer =
    _$UserModelBuiltSerializer();

class _$UserModelBuiltSerializer
    implements StructuredSerializer<UserModelBuilt> {
  @override
  final Iterable<Type> types = const [UserModelBuilt, _$UserModelBuilt];
  @override
  final String wireName = 'UserModelBuilt';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    UserModelBuilt object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(
        object.email,
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
      'createdAt',
      serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      ),
      'lastSeen',
      serializers.serialize(
        object.lastSeen,
        specifiedType: const FullType(DateTime),
      ),
    ];
    Object? value;
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photoUrl')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  UserModelBuilt deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserModelBuiltBuilder();

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
        case 'email':
          result.email =
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
        case 'photoUrl':
          result.photoUrl =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
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
        case 'createdAt':
          result.createdAt =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )!
                  as DateTime;
          break;
        case 'lastSeen':
          result.lastSeen =
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

class _$UserModelBuilt extends UserModelBuilt {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String? photoUrl;
  @override
  final int wins;
  @override
  final int losses;
  @override
  final int draws;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastSeen;

  factory _$UserModelBuilt([void Function(UserModelBuiltBuilder)? updates]) =>
      (UserModelBuiltBuilder()..update(updates))._build();

  _$UserModelBuilt._({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl,
    required this.wins,
    required this.losses,
    required this.draws,
    required this.createdAt,
    required this.lastSeen,
  }) : super._();
  @override
  UserModelBuilt rebuild(void Function(UserModelBuiltBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuiltBuilder toBuilder() => UserModelBuiltBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModelBuilt &&
        id == other.id &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        wins == other.wins &&
        losses == other.losses &&
        draws == other.draws &&
        createdAt == other.createdAt &&
        lastSeen == other.lastSeen;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, wins.hashCode);
    _$hash = $jc(_$hash, losses.hashCode);
    _$hash = $jc(_$hash, draws.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, lastSeen.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserModelBuilt')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('wins', wins)
          ..add('losses', losses)
          ..add('draws', draws)
          ..add('createdAt', createdAt)
          ..add('lastSeen', lastSeen))
        .toString();
  }
}

class UserModelBuiltBuilder
    implements Builder<UserModelBuilt, UserModelBuiltBuilder> {
  _$UserModelBuilt? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  int? _wins;
  int? get wins => _$this._wins;
  set wins(int? wins) => _$this._wins = wins;

  int? _losses;
  int? get losses => _$this._losses;
  set losses(int? losses) => _$this._losses = losses;

  int? _draws;
  int? get draws => _$this._draws;
  set draws(int? draws) => _$this._draws = draws;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _lastSeen;
  DateTime? get lastSeen => _$this._lastSeen;
  set lastSeen(DateTime? lastSeen) => _$this._lastSeen = lastSeen;

  UserModelBuiltBuilder();

  UserModelBuiltBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _wins = $v.wins;
      _losses = $v.losses;
      _draws = $v.draws;
      _createdAt = $v.createdAt;
      _lastSeen = $v.lastSeen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModelBuilt other) {
    _$v = other as _$UserModelBuilt;
  }

  @override
  void update(void Function(UserModelBuiltBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserModelBuilt build() => _build();

  _$UserModelBuilt _build() {
    final _$result =
        _$v ??
        _$UserModelBuilt._(
          id: BuiltValueNullFieldError.checkNotNull(
            id,
            r'UserModelBuilt',
            'id',
          ),
          email: BuiltValueNullFieldError.checkNotNull(
            email,
            r'UserModelBuilt',
            'email',
          ),
          displayName: BuiltValueNullFieldError.checkNotNull(
            displayName,
            r'UserModelBuilt',
            'displayName',
          ),
          photoUrl: photoUrl,
          wins: BuiltValueNullFieldError.checkNotNull(
            wins,
            r'UserModelBuilt',
            'wins',
          ),
          losses: BuiltValueNullFieldError.checkNotNull(
            losses,
            r'UserModelBuilt',
            'losses',
          ),
          draws: BuiltValueNullFieldError.checkNotNull(
            draws,
            r'UserModelBuilt',
            'draws',
          ),
          createdAt: BuiltValueNullFieldError.checkNotNull(
            createdAt,
            r'UserModelBuilt',
            'createdAt',
          ),
          lastSeen: BuiltValueNullFieldError.checkNotNull(
            lastSeen,
            r'UserModelBuilt',
            'lastSeen',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
