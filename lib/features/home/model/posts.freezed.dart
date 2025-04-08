// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Posts {

 int get userId; int get id; String get title; String get body;
/// Create a copy of Posts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsCopyWith<Posts> get copyWith => _$PostsCopyWithImpl<Posts>(this as Posts, _$identity);

  /// Serializes this Posts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Posts&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,id,title,body);

@override
String toString() {
  return 'Posts(userId: $userId, id: $id, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $PostsCopyWith<$Res>  {
  factory $PostsCopyWith(Posts value, $Res Function(Posts) _then) = _$PostsCopyWithImpl;
@useResult
$Res call({
 int userId, int id, String title, String body
});




}
/// @nodoc
class _$PostsCopyWithImpl<$Res>
    implements $PostsCopyWith<$Res> {
  _$PostsCopyWithImpl(this._self, this._then);

  final Posts _self;
  final $Res Function(Posts) _then;

/// Create a copy of Posts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? id = null,Object? title = null,Object? body = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Posts implements Posts {
  const _Posts({required this.userId, required this.id, required this.title, required this.body});
  factory _Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);

@override final  int userId;
@override final  int id;
@override final  String title;
@override final  String body;

/// Create a copy of Posts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostsCopyWith<_Posts> get copyWith => __$PostsCopyWithImpl<_Posts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Posts&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,id,title,body);

@override
String toString() {
  return 'Posts(userId: $userId, id: $id, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$PostsCopyWith<$Res> implements $PostsCopyWith<$Res> {
  factory _$PostsCopyWith(_Posts value, $Res Function(_Posts) _then) = __$PostsCopyWithImpl;
@override @useResult
$Res call({
 int userId, int id, String title, String body
});




}
/// @nodoc
class __$PostsCopyWithImpl<$Res>
    implements _$PostsCopyWith<$Res> {
  __$PostsCopyWithImpl(this._self, this._then);

  final _Posts _self;
  final $Res Function(_Posts) _then;

/// Create a copy of Posts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? id = null,Object? title = null,Object? body = null,}) {
  return _then(_Posts(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
