// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ward.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ward implements DiagnosticableTreeMixin {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'code') String? get code;@JsonKey(name: 'type') String? get type;@JsonKey(name: 'province_id') int? get provinceId;@JsonKey(name: 'sort_order') int? get sortOrder;@JsonKey(name: 'zip_code') String? get zipCode;@JsonKey(name: 'phone_code') String? get phoneCode;@JsonKey(name: 'is_status') int? get isStatus;
/// Create a copy of Ward
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WardCopyWith<Ward> get copyWith => _$WardCopyWithImpl<Ward>(this as Ward, _$identity);

  /// Serializes this Ward to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Ward'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('provinceId', provinceId))..add(DiagnosticsProperty('sortOrder', sortOrder))..add(DiagnosticsProperty('zipCode', zipCode))..add(DiagnosticsProperty('phoneCode', phoneCode))..add(DiagnosticsProperty('isStatus', isStatus));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ward&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.provinceId, provinceId) || other.provinceId == provinceId)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.isStatus, isStatus) || other.isStatus == isStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,type,provinceId,sortOrder,zipCode,phoneCode,isStatus);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Ward(id: $id, name: $name, code: $code, type: $type, provinceId: $provinceId, sortOrder: $sortOrder, zipCode: $zipCode, phoneCode: $phoneCode, isStatus: $isStatus)';
}


}

/// @nodoc
abstract mixin class $WardCopyWith<$Res>  {
  factory $WardCopyWith(Ward value, $Res Function(Ward) _then) = _$WardCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'code') String? code,@JsonKey(name: 'type') String? type,@JsonKey(name: 'province_id') int? provinceId,@JsonKey(name: 'sort_order') int? sortOrder,@JsonKey(name: 'zip_code') String? zipCode,@JsonKey(name: 'phone_code') String? phoneCode,@JsonKey(name: 'is_status') int? isStatus
});




}
/// @nodoc
class _$WardCopyWithImpl<$Res>
    implements $WardCopyWith<$Res> {
  _$WardCopyWithImpl(this._self, this._then);

  final Ward _self;
  final $Res Function(Ward) _then;

/// Create a copy of Ward
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? code = freezed,Object? type = freezed,Object? provinceId = freezed,Object? sortOrder = freezed,Object? zipCode = freezed,Object? phoneCode = freezed,Object? isStatus = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,provinceId: freezed == provinceId ? _self.provinceId : provinceId // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,phoneCode: freezed == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String?,isStatus: freezed == isStatus ? _self.isStatus : isStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Ward].
extension WardPatterns on Ward {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ward value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ward() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ward value)  $default,){
final _that = this;
switch (_that) {
case _Ward():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ward value)?  $default,){
final _that = this;
switch (_that) {
case _Ward() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'code')  String? code, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'province_id')  int? provinceId, @JsonKey(name: 'sort_order')  int? sortOrder, @JsonKey(name: 'zip_code')  String? zipCode, @JsonKey(name: 'phone_code')  String? phoneCode, @JsonKey(name: 'is_status')  int? isStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ward() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.provinceId,_that.sortOrder,_that.zipCode,_that.phoneCode,_that.isStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'code')  String? code, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'province_id')  int? provinceId, @JsonKey(name: 'sort_order')  int? sortOrder, @JsonKey(name: 'zip_code')  String? zipCode, @JsonKey(name: 'phone_code')  String? phoneCode, @JsonKey(name: 'is_status')  int? isStatus)  $default,) {final _that = this;
switch (_that) {
case _Ward():
return $default(_that.id,_that.name,_that.code,_that.type,_that.provinceId,_that.sortOrder,_that.zipCode,_that.phoneCode,_that.isStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'code')  String? code, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'province_id')  int? provinceId, @JsonKey(name: 'sort_order')  int? sortOrder, @JsonKey(name: 'zip_code')  String? zipCode, @JsonKey(name: 'phone_code')  String? phoneCode, @JsonKey(name: 'is_status')  int? isStatus)?  $default,) {final _that = this;
switch (_that) {
case _Ward() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.provinceId,_that.sortOrder,_that.zipCode,_that.phoneCode,_that.isStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ward with DiagnosticableTreeMixin implements Ward {
  const _Ward({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'code') this.code, @JsonKey(name: 'type') this.type, @JsonKey(name: 'province_id') this.provinceId, @JsonKey(name: 'sort_order') this.sortOrder, @JsonKey(name: 'zip_code') this.zipCode, @JsonKey(name: 'phone_code') this.phoneCode, @JsonKey(name: 'is_status') this.isStatus});
  factory _Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'code') final  String? code;
@override@JsonKey(name: 'type') final  String? type;
@override@JsonKey(name: 'province_id') final  int? provinceId;
@override@JsonKey(name: 'sort_order') final  int? sortOrder;
@override@JsonKey(name: 'zip_code') final  String? zipCode;
@override@JsonKey(name: 'phone_code') final  String? phoneCode;
@override@JsonKey(name: 'is_status') final  int? isStatus;

/// Create a copy of Ward
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WardCopyWith<_Ward> get copyWith => __$WardCopyWithImpl<_Ward>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WardToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Ward'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('provinceId', provinceId))..add(DiagnosticsProperty('sortOrder', sortOrder))..add(DiagnosticsProperty('zipCode', zipCode))..add(DiagnosticsProperty('phoneCode', phoneCode))..add(DiagnosticsProperty('isStatus', isStatus));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ward&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.provinceId, provinceId) || other.provinceId == provinceId)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.isStatus, isStatus) || other.isStatus == isStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,type,provinceId,sortOrder,zipCode,phoneCode,isStatus);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Ward(id: $id, name: $name, code: $code, type: $type, provinceId: $provinceId, sortOrder: $sortOrder, zipCode: $zipCode, phoneCode: $phoneCode, isStatus: $isStatus)';
}


}

/// @nodoc
abstract mixin class _$WardCopyWith<$Res> implements $WardCopyWith<$Res> {
  factory _$WardCopyWith(_Ward value, $Res Function(_Ward) _then) = __$WardCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'code') String? code,@JsonKey(name: 'type') String? type,@JsonKey(name: 'province_id') int? provinceId,@JsonKey(name: 'sort_order') int? sortOrder,@JsonKey(name: 'zip_code') String? zipCode,@JsonKey(name: 'phone_code') String? phoneCode,@JsonKey(name: 'is_status') int? isStatus
});




}
/// @nodoc
class __$WardCopyWithImpl<$Res>
    implements _$WardCopyWith<$Res> {
  __$WardCopyWithImpl(this._self, this._then);

  final _Ward _self;
  final $Res Function(_Ward) _then;

/// Create a copy of Ward
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? code = freezed,Object? type = freezed,Object? provinceId = freezed,Object? sortOrder = freezed,Object? zipCode = freezed,Object? phoneCode = freezed,Object? isStatus = freezed,}) {
  return _then(_Ward(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,provinceId: freezed == provinceId ? _self.provinceId : provinceId // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,phoneCode: freezed == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String?,isStatus: freezed == isStatus ? _self.isStatus : isStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
