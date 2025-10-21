// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoveModel {

 String get gameId; String get playerId; int get row; int get col; Player get player; DateTime get timestamp;
/// Create a copy of MoveModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveModelCopyWith<MoveModel> get copyWith => _$MoveModelCopyWithImpl<MoveModel>(this as MoveModel, _$identity);

  /// Serializes this MoveModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveModel&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col)&&(identical(other.player, player) || other.player == player)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,playerId,row,col,player,timestamp);

@override
String toString() {
  return 'MoveModel(gameId: $gameId, playerId: $playerId, row: $row, col: $col, player: $player, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $MoveModelCopyWith<$Res>  {
  factory $MoveModelCopyWith(MoveModel value, $Res Function(MoveModel) _then) = _$MoveModelCopyWithImpl;
@useResult
$Res call({
 String gameId, String playerId, int row, int col, Player player, DateTime timestamp
});




}
/// @nodoc
class _$MoveModelCopyWithImpl<$Res>
    implements $MoveModelCopyWith<$Res> {
  _$MoveModelCopyWithImpl(this._self, this._then);

  final MoveModel _self;
  final $Res Function(MoveModel) _then;

/// Create a copy of MoveModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameId = null,Object? playerId = null,Object? row = null,Object? col = null,Object? player = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MoveModel].
extension MoveModelPatterns on MoveModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoveModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoveModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoveModel value)  $default,){
final _that = this;
switch (_that) {
case _MoveModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoveModel value)?  $default,){
final _that = this;
switch (_that) {
case _MoveModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String gameId,  String playerId,  int row,  int col,  Player player,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoveModel() when $default != null:
return $default(_that.gameId,_that.playerId,_that.row,_that.col,_that.player,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String gameId,  String playerId,  int row,  int col,  Player player,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _MoveModel():
return $default(_that.gameId,_that.playerId,_that.row,_that.col,_that.player,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String gameId,  String playerId,  int row,  int col,  Player player,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _MoveModel() when $default != null:
return $default(_that.gameId,_that.playerId,_that.row,_that.col,_that.player,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoveModel implements MoveModel {
  const _MoveModel({required this.gameId, required this.playerId, required this.row, required this.col, required this.player, required this.timestamp});
  factory _MoveModel.fromJson(Map<String, dynamic> json) => _$MoveModelFromJson(json);

@override final  String gameId;
@override final  String playerId;
@override final  int row;
@override final  int col;
@override final  Player player;
@override final  DateTime timestamp;

/// Create a copy of MoveModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoveModelCopyWith<_MoveModel> get copyWith => __$MoveModelCopyWithImpl<_MoveModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoveModel&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col)&&(identical(other.player, player) || other.player == player)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,playerId,row,col,player,timestamp);

@override
String toString() {
  return 'MoveModel(gameId: $gameId, playerId: $playerId, row: $row, col: $col, player: $player, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$MoveModelCopyWith<$Res> implements $MoveModelCopyWith<$Res> {
  factory _$MoveModelCopyWith(_MoveModel value, $Res Function(_MoveModel) _then) = __$MoveModelCopyWithImpl;
@override @useResult
$Res call({
 String gameId, String playerId, int row, int col, Player player, DateTime timestamp
});




}
/// @nodoc
class __$MoveModelCopyWithImpl<$Res>
    implements _$MoveModelCopyWith<$Res> {
  __$MoveModelCopyWithImpl(this._self, this._then);

  final _MoveModel _self;
  final $Res Function(_MoveModel) _then;

/// Create a copy of MoveModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameId = null,Object? playerId = null,Object? row = null,Object? col = null,Object? player = null,Object? timestamp = null,}) {
  return _then(_MoveModel(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
