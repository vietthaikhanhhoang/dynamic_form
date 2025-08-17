// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Province implements DiagnosticableTreeMixin {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'code') int? get code;@JsonKey(name: 'type') String? get type;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'sort_order') int? get sortOrder;@JsonKey(name: 'zip_code') String? get zipCode;@JsonKey(name: 'phone_code') String? get phoneCode;@JsonKey(name: 'is_status') int? get isStatus;
/// Create a copy of Province
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvinceCopyWith<Province> get copyWith => _$ProvinceCopyWithImpl<Province>(this as Province, _$identity);

  /// Serializes this Province to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Province'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('sortOrder', sortOrder))..add(DiagnosticsProperty('zipCode', zipCode))..add(DiagnosticsProperty('phoneCode', phoneCode))..add(DiagnosticsProperty('isStatus', isStatus));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Province&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.isStatus, isStatus) || other.isStatus == isStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,type,countryId,sortOrder,zipCode,phoneCode,isStatus);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Province(id: $id, name: $name, code: $code, type: $type, countryId: $countryId, sortOrder: $sortOrder, zipCode: $zipCode, phoneCode: $phoneCode, isStatus: $isStatus)';
}


}

/// @nodoc
abstract mixin class $ProvinceCopyWith<$Res>  {
  factory $ProvinceCopyWith(Province value, $Res Function(Province) _then) = _$ProvinceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'code') int? code,@JsonKey(name: 'type') String? type,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'sort_order') int? sortOrder,@JsonKey(name: 'zip_code') String? zipCode,@JsonKey(name: 'phone_code') String? phoneCode,@JsonKey(name: 'is_status') int? isStatus
});




}
/// @nodoc
class _$ProvinceCopyWithImpl<$Res>
    implements $ProvinceCopyWith<$Res> {
  _$ProvinceCopyWithImpl(this._self, this._then);

  final Province _self;
  final $Res Function(Province) _then;

/// Create a copy of Province
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? code = freezed,Object? type = freezed,Object? countryId = freezed,Object? sortOrder = freezed,Object? zipCode = freezed,Object? phoneCode = freezed,Object? isStatus = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,phoneCode: freezed == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String?,isStatus: freezed == isStatus ? _self.isStatus : isStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Province].
extension ProvincePatterns on Province {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Province value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Province() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Province value)  $default,){
final _that = this;
switch (_that) {
case _Province():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Province value)?  $default,){
final _that = this;
switch (_that) {
case _Province() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'code')  int? code, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'sort_order')  int? sortOrder, @JsonKey(name: 'zip_code')  String? zipCode, @JsonKey(name: 'phone_code')  String? phoneCode, @JsonKey(name: 'is_status')  int? isStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Province() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.countryId,_that.sortOrder,_that.zipCode,_that.phoneCode,_that.isStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'code')  int? code, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'sort_order')  int? sortOrder, @JsonKey(name: 'zip_code')  String? zipCode, @JsonKey(name: 'phone_code')  String? phoneCode, @JsonKey(name: 'is_status')  int? isStatus)  $default,) {final _that = this;
switch (_that) {
case _Province():
return $default(_that.id,_that.name,_that.code,_that.type,_that.countryId,_that.sortOrder,_that.zipCode,_that.phoneCode,_that.isStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'code')  int? code, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'sort_order')  int? sortOrder, @JsonKey(name: 'zip_code')  String? zipCode, @JsonKey(name: 'phone_code')  String? phoneCode, @JsonKey(name: 'is_status')  int? isStatus)?  $default,) {final _that = this;
switch (_that) {
case _Province() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.countryId,_that.sortOrder,_that.zipCode,_that.phoneCode,_that.isStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Province with DiagnosticableTreeMixin implements Province {
  const _Province({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'code') this.code, @JsonKey(name: 'type') this.type, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'sort_order') this.sortOrder, @JsonKey(name: 'zip_code') this.zipCode, @JsonKey(name: 'phone_code') this.phoneCode, @JsonKey(name: 'is_status') this.isStatus});
  factory _Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'code') final  int? code;
@override@JsonKey(name: 'type') final  String? type;
@override@JsonKey(name: 'country_id') final  int? countryId;
@override@JsonKey(name: 'sort_order') final  int? sortOrder;
@override@JsonKey(name: 'zip_code') final  String? zipCode;
@override@JsonKey(name: 'phone_code') final  String? phoneCode;
@override@JsonKey(name: 'is_status') final  int? isStatus;

/// Create a copy of Province
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvinceCopyWith<_Province> get copyWith => __$ProvinceCopyWithImpl<_Province>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProvinceToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Province'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('code', code))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('sortOrder', sortOrder))..add(DiagnosticsProperty('zipCode', zipCode))..add(DiagnosticsProperty('phoneCode', phoneCode))..add(DiagnosticsProperty('isStatus', isStatus));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Province&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.isStatus, isStatus) || other.isStatus == isStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,type,countryId,sortOrder,zipCode,phoneCode,isStatus);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Province(id: $id, name: $name, code: $code, type: $type, countryId: $countryId, sortOrder: $sortOrder, zipCode: $zipCode, phoneCode: $phoneCode, isStatus: $isStatus)';
}


}

/// @nodoc
abstract mixin class _$ProvinceCopyWith<$Res> implements $ProvinceCopyWith<$Res> {
  factory _$ProvinceCopyWith(_Province value, $Res Function(_Province) _then) = __$ProvinceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'code') int? code,@JsonKey(name: 'type') String? type,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'sort_order') int? sortOrder,@JsonKey(name: 'zip_code') String? zipCode,@JsonKey(name: 'phone_code') String? phoneCode,@JsonKey(name: 'is_status') int? isStatus
});




}
/// @nodoc
class __$ProvinceCopyWithImpl<$Res>
    implements _$ProvinceCopyWith<$Res> {
  __$ProvinceCopyWithImpl(this._self, this._then);

  final _Province _self;
  final $Res Function(_Province) _then;

/// Create a copy of Province
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? code = freezed,Object? type = freezed,Object? countryId = freezed,Object? sortOrder = freezed,Object? zipCode = freezed,Object? phoneCode = freezed,Object? isStatus = freezed,}) {
  return _then(_Province(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,phoneCode: freezed == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String?,isStatus: freezed == isStatus ? _self.isStatus : isStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
