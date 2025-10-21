// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameModel {

 String get id; String get player1Id; String? get player2Id; String get player1Name; String? get player2Name; List<List<String>> get board;// 3x3 board
 Player get currentTurn; GameStatus get status; String? get winnerId; DateTime get createdAt; DateTime? get completedAt; int get moveCount;
/// Create a copy of GameModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameModelCopyWith<GameModel> get copyWith => _$GameModelCopyWithImpl<GameModel>(this as GameModel, _$identity);

  /// Serializes this GameModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModel&&(identical(other.id, id) || other.id == id)&&(identical(other.player1Id, player1Id) || other.player1Id == player1Id)&&(identical(other.player2Id, player2Id) || other.player2Id == player2Id)&&(identical(other.player1Name, player1Name) || other.player1Name == player1Name)&&(identical(other.player2Name, player2Name) || other.player2Name == player2Name)&&const DeepCollectionEquality().equals(other.board, board)&&(identical(other.currentTurn, currentTurn) || other.currentTurn == currentTurn)&&(identical(other.status, status) || other.status == status)&&(identical(other.winnerId, winnerId) || other.winnerId == winnerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.moveCount, moveCount) || other.moveCount == moveCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,player1Id,player2Id,player1Name,player2Name,const DeepCollectionEquality().hash(board),currentTurn,status,winnerId,createdAt,completedAt,moveCount);

@override
String toString() {
  return 'GameModel(id: $id, player1Id: $player1Id, player2Id: $player2Id, player1Name: $player1Name, player2Name: $player2Name, board: $board, currentTurn: $currentTurn, status: $status, winnerId: $winnerId, createdAt: $createdAt, completedAt: $completedAt, moveCount: $moveCount)';
}


}

/// @nodoc
abstract mixin class $GameModelCopyWith<$Res>  {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) _then) = _$GameModelCopyWithImpl;
@useResult
$Res call({
 String id, String player1Id, String? player2Id, String player1Name, String? player2Name, List<List<String>> board, Player currentTurn, GameStatus status, String? winnerId, DateTime createdAt, DateTime? completedAt, int moveCount
});




}
/// @nodoc
class _$GameModelCopyWithImpl<$Res>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._self, this._then);

  final GameModel _self;
  final $Res Function(GameModel) _then;

/// Create a copy of GameModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? player1Id = null,Object? player2Id = freezed,Object? player1Name = null,Object? player2Name = freezed,Object? board = null,Object? currentTurn = null,Object? status = null,Object? winnerId = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? moveCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,player1Id: null == player1Id ? _self.player1Id : player1Id // ignore: cast_nullable_to_non_nullable
as String,player2Id: freezed == player2Id ? _self.player2Id : player2Id // ignore: cast_nullable_to_non_nullable
as String?,player1Name: null == player1Name ? _self.player1Name : player1Name // ignore: cast_nullable_to_non_nullable
as String,player2Name: freezed == player2Name ? _self.player2Name : player2Name // ignore: cast_nullable_to_non_nullable
as String?,board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as List<List<String>>,currentTurn: null == currentTurn ? _self.currentTurn : currentTurn // ignore: cast_nullable_to_non_nullable
as Player,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,winnerId: freezed == winnerId ? _self.winnerId : winnerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,moveCount: null == moveCount ? _self.moveCount : moveCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameModel].
extension GameModelPatterns on GameModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameModel value)  $default,){
final _that = this;
switch (_that) {
case _GameModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameModel value)?  $default,){
final _that = this;
switch (_that) {
case _GameModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String player1Id,  String? player2Id,  String player1Name,  String? player2Name,  List<List<String>> board,  Player currentTurn,  GameStatus status,  String? winnerId,  DateTime createdAt,  DateTime? completedAt,  int moveCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameModel() when $default != null:
return $default(_that.id,_that.player1Id,_that.player2Id,_that.player1Name,_that.player2Name,_that.board,_that.currentTurn,_that.status,_that.winnerId,_that.createdAt,_that.completedAt,_that.moveCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String player1Id,  String? player2Id,  String player1Name,  String? player2Name,  List<List<String>> board,  Player currentTurn,  GameStatus status,  String? winnerId,  DateTime createdAt,  DateTime? completedAt,  int moveCount)  $default,) {final _that = this;
switch (_that) {
case _GameModel():
return $default(_that.id,_that.player1Id,_that.player2Id,_that.player1Name,_that.player2Name,_that.board,_that.currentTurn,_that.status,_that.winnerId,_that.createdAt,_that.completedAt,_that.moveCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String player1Id,  String? player2Id,  String player1Name,  String? player2Name,  List<List<String>> board,  Player currentTurn,  GameStatus status,  String? winnerId,  DateTime createdAt,  DateTime? completedAt,  int moveCount)?  $default,) {final _that = this;
switch (_that) {
case _GameModel() when $default != null:
return $default(_that.id,_that.player1Id,_that.player2Id,_that.player1Name,_that.player2Name,_that.board,_that.currentTurn,_that.status,_that.winnerId,_that.createdAt,_that.completedAt,_that.moveCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameModel implements GameModel {
  const _GameModel({required this.id, required this.player1Id, this.player2Id, required this.player1Name, this.player2Name, required final  List<List<String>> board, required this.currentTurn, required this.status, this.winnerId, required this.createdAt, this.completedAt, required this.moveCount}): _board = board;
  factory _GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);

@override final  String id;
@override final  String player1Id;
@override final  String? player2Id;
@override final  String player1Name;
@override final  String? player2Name;
 final  List<List<String>> _board;
@override List<List<String>> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

// 3x3 board
@override final  Player currentTurn;
@override final  GameStatus status;
@override final  String? winnerId;
@override final  DateTime createdAt;
@override final  DateTime? completedAt;
@override final  int moveCount;

/// Create a copy of GameModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameModelCopyWith<_GameModel> get copyWith => __$GameModelCopyWithImpl<_GameModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameModel&&(identical(other.id, id) || other.id == id)&&(identical(other.player1Id, player1Id) || other.player1Id == player1Id)&&(identical(other.player2Id, player2Id) || other.player2Id == player2Id)&&(identical(other.player1Name, player1Name) || other.player1Name == player1Name)&&(identical(other.player2Name, player2Name) || other.player2Name == player2Name)&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.currentTurn, currentTurn) || other.currentTurn == currentTurn)&&(identical(other.status, status) || other.status == status)&&(identical(other.winnerId, winnerId) || other.winnerId == winnerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.moveCount, moveCount) || other.moveCount == moveCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,player1Id,player2Id,player1Name,player2Name,const DeepCollectionEquality().hash(_board),currentTurn,status,winnerId,createdAt,completedAt,moveCount);

@override
String toString() {
  return 'GameModel(id: $id, player1Id: $player1Id, player2Id: $player2Id, player1Name: $player1Name, player2Name: $player2Name, board: $board, currentTurn: $currentTurn, status: $status, winnerId: $winnerId, createdAt: $createdAt, completedAt: $completedAt, moveCount: $moveCount)';
}


}

/// @nodoc
abstract mixin class _$GameModelCopyWith<$Res> implements $GameModelCopyWith<$Res> {
  factory _$GameModelCopyWith(_GameModel value, $Res Function(_GameModel) _then) = __$GameModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String player1Id, String? player2Id, String player1Name, String? player2Name, List<List<String>> board, Player currentTurn, GameStatus status, String? winnerId, DateTime createdAt, DateTime? completedAt, int moveCount
});




}
/// @nodoc
class __$GameModelCopyWithImpl<$Res>
    implements _$GameModelCopyWith<$Res> {
  __$GameModelCopyWithImpl(this._self, this._then);

  final _GameModel _self;
  final $Res Function(_GameModel) _then;

/// Create a copy of GameModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? player1Id = null,Object? player2Id = freezed,Object? player1Name = null,Object? player2Name = freezed,Object? board = null,Object? currentTurn = null,Object? status = null,Object? winnerId = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? moveCount = null,}) {
  return _then(_GameModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,player1Id: null == player1Id ? _self.player1Id : player1Id // ignore: cast_nullable_to_non_nullable
as String,player2Id: freezed == player2Id ? _self.player2Id : player2Id // ignore: cast_nullable_to_non_nullable
as String?,player1Name: null == player1Name ? _self.player1Name : player1Name // ignore: cast_nullable_to_non_nullable
as String,player2Name: freezed == player2Name ? _self.player2Name : player2Name // ignore: cast_nullable_to_non_nullable
as String?,board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<List<String>>,currentTurn: null == currentTurn ? _self.currentTurn : currentTurn // ignore: cast_nullable_to_non_nullable
as Player,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,winnerId: freezed == winnerId ? _self.winnerId : winnerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,moveCount: null == moveCount ? _self.moveCount : moveCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
