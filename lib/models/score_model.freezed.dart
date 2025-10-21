// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScoreModel {

 String get userId; String get displayName; int get wins; int get losses; int get draws; int get totalGames; double get winRate;
/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreModelCopyWith<ScoreModel> get copyWith => _$ScoreModelCopyWithImpl<ScoreModel>(this as ScoreModel, _$identity);

  /// Serializes this ScoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.draws, draws) || other.draws == draws)&&(identical(other.totalGames, totalGames) || other.totalGames == totalGames)&&(identical(other.winRate, winRate) || other.winRate == winRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,wins,losses,draws,totalGames,winRate);

@override
String toString() {
  return 'ScoreModel(userId: $userId, displayName: $displayName, wins: $wins, losses: $losses, draws: $draws, totalGames: $totalGames, winRate: $winRate)';
}


}

/// @nodoc
abstract mixin class $ScoreModelCopyWith<$Res>  {
  factory $ScoreModelCopyWith(ScoreModel value, $Res Function(ScoreModel) _then) = _$ScoreModelCopyWithImpl;
@useResult
$Res call({
 String userId, String displayName, int wins, int losses, int draws, int totalGames, double winRate
});




}
/// @nodoc
class _$ScoreModelCopyWithImpl<$Res>
    implements $ScoreModelCopyWith<$Res> {
  _$ScoreModelCopyWithImpl(this._self, this._then);

  final ScoreModel _self;
  final $Res Function(ScoreModel) _then;

/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? displayName = null,Object? wins = null,Object? losses = null,Object? draws = null,Object? totalGames = null,Object? winRate = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,draws: null == draws ? _self.draws : draws // ignore: cast_nullable_to_non_nullable
as int,totalGames: null == totalGames ? _self.totalGames : totalGames // ignore: cast_nullable_to_non_nullable
as int,winRate: null == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoreModel].
extension ScoreModelPatterns on ScoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoreModel value)  $default,){
final _that = this;
switch (_that) {
case _ScoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String displayName,  int wins,  int losses,  int draws,  int totalGames,  double winRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoreModel() when $default != null:
return $default(_that.userId,_that.displayName,_that.wins,_that.losses,_that.draws,_that.totalGames,_that.winRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String displayName,  int wins,  int losses,  int draws,  int totalGames,  double winRate)  $default,) {final _that = this;
switch (_that) {
case _ScoreModel():
return $default(_that.userId,_that.displayName,_that.wins,_that.losses,_that.draws,_that.totalGames,_that.winRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String displayName,  int wins,  int losses,  int draws,  int totalGames,  double winRate)?  $default,) {final _that = this;
switch (_that) {
case _ScoreModel() when $default != null:
return $default(_that.userId,_that.displayName,_that.wins,_that.losses,_that.draws,_that.totalGames,_that.winRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoreModel implements ScoreModel {
  const _ScoreModel({required this.userId, required this.displayName, required this.wins, required this.losses, required this.draws, required this.totalGames, required this.winRate});
  factory _ScoreModel.fromJson(Map<String, dynamic> json) => _$ScoreModelFromJson(json);

@override final  String userId;
@override final  String displayName;
@override final  int wins;
@override final  int losses;
@override final  int draws;
@override final  int totalGames;
@override final  double winRate;

/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreModelCopyWith<_ScoreModel> get copyWith => __$ScoreModelCopyWithImpl<_ScoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.draws, draws) || other.draws == draws)&&(identical(other.totalGames, totalGames) || other.totalGames == totalGames)&&(identical(other.winRate, winRate) || other.winRate == winRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,wins,losses,draws,totalGames,winRate);

@override
String toString() {
  return 'ScoreModel(userId: $userId, displayName: $displayName, wins: $wins, losses: $losses, draws: $draws, totalGames: $totalGames, winRate: $winRate)';
}


}

/// @nodoc
abstract mixin class _$ScoreModelCopyWith<$Res> implements $ScoreModelCopyWith<$Res> {
  factory _$ScoreModelCopyWith(_ScoreModel value, $Res Function(_ScoreModel) _then) = __$ScoreModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String displayName, int wins, int losses, int draws, int totalGames, double winRate
});




}
/// @nodoc
class __$ScoreModelCopyWithImpl<$Res>
    implements _$ScoreModelCopyWith<$Res> {
  __$ScoreModelCopyWithImpl(this._self, this._then);

  final _ScoreModel _self;
  final $Res Function(_ScoreModel) _then;

/// Create a copy of ScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? displayName = null,Object? wins = null,Object? losses = null,Object? draws = null,Object? totalGames = null,Object? winRate = null,}) {
  return _then(_ScoreModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,draws: null == draws ? _self.draws : draws // ignore: cast_nullable_to_non_nullable
as int,totalGames: null == totalGames ? _self.totalGames : totalGames // ignore: cast_nullable_to_non_nullable
as int,winRate: null == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
