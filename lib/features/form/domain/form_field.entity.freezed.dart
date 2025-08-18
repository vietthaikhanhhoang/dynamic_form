// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_field.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormFieldEntity {

@JsonKey(name: 'type') String? get type;@JsonKey(name: 'label') String? get label;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'isRequired') bool? get isRequired;@JsonKey(name: 'nameSaveLabel') String? get nameSaveLabel;@JsonKey(name: 'nameSaveExtraOption') String? get nameSaveExtraOption;@JsonKey(name: 'colSm') int? get colSm;@JsonKey(name: 'colMd') int? get colMd;@JsonKey(name: 'colLg') int? get colLg;@JsonKey(name: 'options') List<FormFieldOption>? get options;@JsonKey(name: 'valueIsArray') bool? get valueIsArray;@JsonKey(name: 'row') int? get row;@JsonKey(name: 'max') int? get max;// 👇 Bổ sung field này
@JsonKey(name: 'nameFieldDependent') String? get nameFieldDependent;
/// Create a copy of FormFieldEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormFieldEntityCopyWith<FormFieldEntity> get copyWith => _$FormFieldEntityCopyWithImpl<FormFieldEntity>(this as FormFieldEntity, _$identity);

  /// Serializes this FormFieldEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormFieldEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.name, name) || other.name == name)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.nameSaveLabel, nameSaveLabel) || other.nameSaveLabel == nameSaveLabel)&&(identical(other.nameSaveExtraOption, nameSaveExtraOption) || other.nameSaveExtraOption == nameSaveExtraOption)&&(identical(other.colSm, colSm) || other.colSm == colSm)&&(identical(other.colMd, colMd) || other.colMd == colMd)&&(identical(other.colLg, colLg) || other.colLg == colLg)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.valueIsArray, valueIsArray) || other.valueIsArray == valueIsArray)&&(identical(other.row, row) || other.row == row)&&(identical(other.max, max) || other.max == max)&&(identical(other.nameFieldDependent, nameFieldDependent) || other.nameFieldDependent == nameFieldDependent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,label,name,isRequired,nameSaveLabel,nameSaveExtraOption,colSm,colMd,colLg,const DeepCollectionEquality().hash(options),valueIsArray,row,max,nameFieldDependent);

@override
String toString() {
  return 'FormFieldEntity(type: $type, label: $label, name: $name, isRequired: $isRequired, nameSaveLabel: $nameSaveLabel, nameSaveExtraOption: $nameSaveExtraOption, colSm: $colSm, colMd: $colMd, colLg: $colLg, options: $options, valueIsArray: $valueIsArray, row: $row, max: $max, nameFieldDependent: $nameFieldDependent)';
}


}

/// @nodoc
abstract mixin class $FormFieldEntityCopyWith<$Res>  {
  factory $FormFieldEntityCopyWith(FormFieldEntity value, $Res Function(FormFieldEntity) _then) = _$FormFieldEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'type') String? type,@JsonKey(name: 'label') String? label,@JsonKey(name: 'name') String? name,@JsonKey(name: 'isRequired') bool? isRequired,@JsonKey(name: 'nameSaveLabel') String? nameSaveLabel,@JsonKey(name: 'nameSaveExtraOption') String? nameSaveExtraOption,@JsonKey(name: 'colSm') int? colSm,@JsonKey(name: 'colMd') int? colMd,@JsonKey(name: 'colLg') int? colLg,@JsonKey(name: 'options') List<FormFieldOption>? options,@JsonKey(name: 'valueIsArray') bool? valueIsArray,@JsonKey(name: 'row') int? row,@JsonKey(name: 'max') int? max,@JsonKey(name: 'nameFieldDependent') String? nameFieldDependent
});




}
/// @nodoc
class _$FormFieldEntityCopyWithImpl<$Res>
    implements $FormFieldEntityCopyWith<$Res> {
  _$FormFieldEntityCopyWithImpl(this._self, this._then);

  final FormFieldEntity _self;
  final $Res Function(FormFieldEntity) _then;

/// Create a copy of FormFieldEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? label = freezed,Object? name = freezed,Object? isRequired = freezed,Object? nameSaveLabel = freezed,Object? nameSaveExtraOption = freezed,Object? colSm = freezed,Object? colMd = freezed,Object? colLg = freezed,Object? options = freezed,Object? valueIsArray = freezed,Object? row = freezed,Object? max = freezed,Object? nameFieldDependent = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,nameSaveLabel: freezed == nameSaveLabel ? _self.nameSaveLabel : nameSaveLabel // ignore: cast_nullable_to_non_nullable
as String?,nameSaveExtraOption: freezed == nameSaveExtraOption ? _self.nameSaveExtraOption : nameSaveExtraOption // ignore: cast_nullable_to_non_nullable
as String?,colSm: freezed == colSm ? _self.colSm : colSm // ignore: cast_nullable_to_non_nullable
as int?,colMd: freezed == colMd ? _self.colMd : colMd // ignore: cast_nullable_to_non_nullable
as int?,colLg: freezed == colLg ? _self.colLg : colLg // ignore: cast_nullable_to_non_nullable
as int?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<FormFieldOption>?,valueIsArray: freezed == valueIsArray ? _self.valueIsArray : valueIsArray // ignore: cast_nullable_to_non_nullable
as bool?,row: freezed == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,nameFieldDependent: freezed == nameFieldDependent ? _self.nameFieldDependent : nameFieldDependent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FormFieldEntity].
extension FormFieldEntityPatterns on FormFieldEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormFieldEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormFieldEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormFieldEntity value)  $default,){
final _that = this;
switch (_that) {
case _FormFieldEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormFieldEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FormFieldEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  String? type, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'isRequired')  bool? isRequired, @JsonKey(name: 'nameSaveLabel')  String? nameSaveLabel, @JsonKey(name: 'nameSaveExtraOption')  String? nameSaveExtraOption, @JsonKey(name: 'colSm')  int? colSm, @JsonKey(name: 'colMd')  int? colMd, @JsonKey(name: 'colLg')  int? colLg, @JsonKey(name: 'options')  List<FormFieldOption>? options, @JsonKey(name: 'valueIsArray')  bool? valueIsArray, @JsonKey(name: 'row')  int? row, @JsonKey(name: 'max')  int? max, @JsonKey(name: 'nameFieldDependent')  String? nameFieldDependent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormFieldEntity() when $default != null:
return $default(_that.type,_that.label,_that.name,_that.isRequired,_that.nameSaveLabel,_that.nameSaveExtraOption,_that.colSm,_that.colMd,_that.colLg,_that.options,_that.valueIsArray,_that.row,_that.max,_that.nameFieldDependent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  String? type, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'isRequired')  bool? isRequired, @JsonKey(name: 'nameSaveLabel')  String? nameSaveLabel, @JsonKey(name: 'nameSaveExtraOption')  String? nameSaveExtraOption, @JsonKey(name: 'colSm')  int? colSm, @JsonKey(name: 'colMd')  int? colMd, @JsonKey(name: 'colLg')  int? colLg, @JsonKey(name: 'options')  List<FormFieldOption>? options, @JsonKey(name: 'valueIsArray')  bool? valueIsArray, @JsonKey(name: 'row')  int? row, @JsonKey(name: 'max')  int? max, @JsonKey(name: 'nameFieldDependent')  String? nameFieldDependent)  $default,) {final _that = this;
switch (_that) {
case _FormFieldEntity():
return $default(_that.type,_that.label,_that.name,_that.isRequired,_that.nameSaveLabel,_that.nameSaveExtraOption,_that.colSm,_that.colMd,_that.colLg,_that.options,_that.valueIsArray,_that.row,_that.max,_that.nameFieldDependent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'type')  String? type, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'isRequired')  bool? isRequired, @JsonKey(name: 'nameSaveLabel')  String? nameSaveLabel, @JsonKey(name: 'nameSaveExtraOption')  String? nameSaveExtraOption, @JsonKey(name: 'colSm')  int? colSm, @JsonKey(name: 'colMd')  int? colMd, @JsonKey(name: 'colLg')  int? colLg, @JsonKey(name: 'options')  List<FormFieldOption>? options, @JsonKey(name: 'valueIsArray')  bool? valueIsArray, @JsonKey(name: 'row')  int? row, @JsonKey(name: 'max')  int? max, @JsonKey(name: 'nameFieldDependent')  String? nameFieldDependent)?  $default,) {final _that = this;
switch (_that) {
case _FormFieldEntity() when $default != null:
return $default(_that.type,_that.label,_that.name,_that.isRequired,_that.nameSaveLabel,_that.nameSaveExtraOption,_that.colSm,_that.colMd,_that.colLg,_that.options,_that.valueIsArray,_that.row,_that.max,_that.nameFieldDependent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormFieldEntity implements FormFieldEntity {
  const _FormFieldEntity({@JsonKey(name: 'type') this.type, @JsonKey(name: 'label') this.label, @JsonKey(name: 'name') this.name, @JsonKey(name: 'isRequired') this.isRequired, @JsonKey(name: 'nameSaveLabel') this.nameSaveLabel, @JsonKey(name: 'nameSaveExtraOption') this.nameSaveExtraOption, @JsonKey(name: 'colSm') this.colSm, @JsonKey(name: 'colMd') this.colMd, @JsonKey(name: 'colLg') this.colLg, @JsonKey(name: 'options') final  List<FormFieldOption>? options, @JsonKey(name: 'valueIsArray') this.valueIsArray, @JsonKey(name: 'row') this.row, @JsonKey(name: 'max') this.max, @JsonKey(name: 'nameFieldDependent') this.nameFieldDependent}): _options = options;
  factory _FormFieldEntity.fromJson(Map<String, dynamic> json) => _$FormFieldEntityFromJson(json);

@override@JsonKey(name: 'type') final  String? type;
@override@JsonKey(name: 'label') final  String? label;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'isRequired') final  bool? isRequired;
@override@JsonKey(name: 'nameSaveLabel') final  String? nameSaveLabel;
@override@JsonKey(name: 'nameSaveExtraOption') final  String? nameSaveExtraOption;
@override@JsonKey(name: 'colSm') final  int? colSm;
@override@JsonKey(name: 'colMd') final  int? colMd;
@override@JsonKey(name: 'colLg') final  int? colLg;
 final  List<FormFieldOption>? _options;
@override@JsonKey(name: 'options') List<FormFieldOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'valueIsArray') final  bool? valueIsArray;
@override@JsonKey(name: 'row') final  int? row;
@override@JsonKey(name: 'max') final  int? max;
// 👇 Bổ sung field này
@override@JsonKey(name: 'nameFieldDependent') final  String? nameFieldDependent;

/// Create a copy of FormFieldEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormFieldEntityCopyWith<_FormFieldEntity> get copyWith => __$FormFieldEntityCopyWithImpl<_FormFieldEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormFieldEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormFieldEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.name, name) || other.name == name)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.nameSaveLabel, nameSaveLabel) || other.nameSaveLabel == nameSaveLabel)&&(identical(other.nameSaveExtraOption, nameSaveExtraOption) || other.nameSaveExtraOption == nameSaveExtraOption)&&(identical(other.colSm, colSm) || other.colSm == colSm)&&(identical(other.colMd, colMd) || other.colMd == colMd)&&(identical(other.colLg, colLg) || other.colLg == colLg)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.valueIsArray, valueIsArray) || other.valueIsArray == valueIsArray)&&(identical(other.row, row) || other.row == row)&&(identical(other.max, max) || other.max == max)&&(identical(other.nameFieldDependent, nameFieldDependent) || other.nameFieldDependent == nameFieldDependent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,label,name,isRequired,nameSaveLabel,nameSaveExtraOption,colSm,colMd,colLg,const DeepCollectionEquality().hash(_options),valueIsArray,row,max,nameFieldDependent);

@override
String toString() {
  return 'FormFieldEntity(type: $type, label: $label, name: $name, isRequired: $isRequired, nameSaveLabel: $nameSaveLabel, nameSaveExtraOption: $nameSaveExtraOption, colSm: $colSm, colMd: $colMd, colLg: $colLg, options: $options, valueIsArray: $valueIsArray, row: $row, max: $max, nameFieldDependent: $nameFieldDependent)';
}


}

/// @nodoc
abstract mixin class _$FormFieldEntityCopyWith<$Res> implements $FormFieldEntityCopyWith<$Res> {
  factory _$FormFieldEntityCopyWith(_FormFieldEntity value, $Res Function(_FormFieldEntity) _then) = __$FormFieldEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'type') String? type,@JsonKey(name: 'label') String? label,@JsonKey(name: 'name') String? name,@JsonKey(name: 'isRequired') bool? isRequired,@JsonKey(name: 'nameSaveLabel') String? nameSaveLabel,@JsonKey(name: 'nameSaveExtraOption') String? nameSaveExtraOption,@JsonKey(name: 'colSm') int? colSm,@JsonKey(name: 'colMd') int? colMd,@JsonKey(name: 'colLg') int? colLg,@JsonKey(name: 'options') List<FormFieldOption>? options,@JsonKey(name: 'valueIsArray') bool? valueIsArray,@JsonKey(name: 'row') int? row,@JsonKey(name: 'max') int? max,@JsonKey(name: 'nameFieldDependent') String? nameFieldDependent
});




}
/// @nodoc
class __$FormFieldEntityCopyWithImpl<$Res>
    implements _$FormFieldEntityCopyWith<$Res> {
  __$FormFieldEntityCopyWithImpl(this._self, this._then);

  final _FormFieldEntity _self;
  final $Res Function(_FormFieldEntity) _then;

/// Create a copy of FormFieldEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? label = freezed,Object? name = freezed,Object? isRequired = freezed,Object? nameSaveLabel = freezed,Object? nameSaveExtraOption = freezed,Object? colSm = freezed,Object? colMd = freezed,Object? colLg = freezed,Object? options = freezed,Object? valueIsArray = freezed,Object? row = freezed,Object? max = freezed,Object? nameFieldDependent = freezed,}) {
  return _then(_FormFieldEntity(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,nameSaveLabel: freezed == nameSaveLabel ? _self.nameSaveLabel : nameSaveLabel // ignore: cast_nullable_to_non_nullable
as String?,nameSaveExtraOption: freezed == nameSaveExtraOption ? _self.nameSaveExtraOption : nameSaveExtraOption // ignore: cast_nullable_to_non_nullable
as String?,colSm: freezed == colSm ? _self.colSm : colSm // ignore: cast_nullable_to_non_nullable
as int?,colMd: freezed == colMd ? _self.colMd : colMd // ignore: cast_nullable_to_non_nullable
as int?,colLg: freezed == colLg ? _self.colLg : colLg // ignore: cast_nullable_to_non_nullable
as int?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<FormFieldOption>?,valueIsArray: freezed == valueIsArray ? _self.valueIsArray : valueIsArray // ignore: cast_nullable_to_non_nullable
as bool?,row: freezed == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,nameFieldDependent: freezed == nameFieldDependent ? _self.nameFieldDependent : nameFieldDependent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FormFieldOption {

@JsonKey(name: 'value') String? get value;@JsonKey(name: 'label') String? get label;@JsonKey(name: 'isExtraOption') bool? get isExtraOption;
/// Create a copy of FormFieldOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormFieldOptionCopyWith<FormFieldOption> get copyWith => _$FormFieldOptionCopyWithImpl<FormFieldOption>(this as FormFieldOption, _$identity);

  /// Serializes this FormFieldOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormFieldOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.isExtraOption, isExtraOption) || other.isExtraOption == isExtraOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,isExtraOption);

@override
String toString() {
  return 'FormFieldOption(value: $value, label: $label, isExtraOption: $isExtraOption)';
}


}

/// @nodoc
abstract mixin class $FormFieldOptionCopyWith<$Res>  {
  factory $FormFieldOptionCopyWith(FormFieldOption value, $Res Function(FormFieldOption) _then) = _$FormFieldOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'value') String? value,@JsonKey(name: 'label') String? label,@JsonKey(name: 'isExtraOption') bool? isExtraOption
});




}
/// @nodoc
class _$FormFieldOptionCopyWithImpl<$Res>
    implements $FormFieldOptionCopyWith<$Res> {
  _$FormFieldOptionCopyWithImpl(this._self, this._then);

  final FormFieldOption _self;
  final $Res Function(FormFieldOption) _then;

/// Create a copy of FormFieldOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? label = freezed,Object? isExtraOption = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,isExtraOption: freezed == isExtraOption ? _self.isExtraOption : isExtraOption // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [FormFieldOption].
extension FormFieldOptionPatterns on FormFieldOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormFieldOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormFieldOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormFieldOption value)  $default,){
final _that = this;
switch (_that) {
case _FormFieldOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormFieldOption value)?  $default,){
final _that = this;
switch (_that) {
case _FormFieldOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'value')  String? value, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'isExtraOption')  bool? isExtraOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormFieldOption() when $default != null:
return $default(_that.value,_that.label,_that.isExtraOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'value')  String? value, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'isExtraOption')  bool? isExtraOption)  $default,) {final _that = this;
switch (_that) {
case _FormFieldOption():
return $default(_that.value,_that.label,_that.isExtraOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'value')  String? value, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'isExtraOption')  bool? isExtraOption)?  $default,) {final _that = this;
switch (_that) {
case _FormFieldOption() when $default != null:
return $default(_that.value,_that.label,_that.isExtraOption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormFieldOption implements FormFieldOption {
  const _FormFieldOption({@JsonKey(name: 'value') this.value, @JsonKey(name: 'label') this.label, @JsonKey(name: 'isExtraOption') this.isExtraOption});
  factory _FormFieldOption.fromJson(Map<String, dynamic> json) => _$FormFieldOptionFromJson(json);

@override@JsonKey(name: 'value') final  String? value;
@override@JsonKey(name: 'label') final  String? label;
@override@JsonKey(name: 'isExtraOption') final  bool? isExtraOption;

/// Create a copy of FormFieldOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormFieldOptionCopyWith<_FormFieldOption> get copyWith => __$FormFieldOptionCopyWithImpl<_FormFieldOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormFieldOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormFieldOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.isExtraOption, isExtraOption) || other.isExtraOption == isExtraOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,isExtraOption);

@override
String toString() {
  return 'FormFieldOption(value: $value, label: $label, isExtraOption: $isExtraOption)';
}


}

/// @nodoc
abstract mixin class _$FormFieldOptionCopyWith<$Res> implements $FormFieldOptionCopyWith<$Res> {
  factory _$FormFieldOptionCopyWith(_FormFieldOption value, $Res Function(_FormFieldOption) _then) = __$FormFieldOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'value') String? value,@JsonKey(name: 'label') String? label,@JsonKey(name: 'isExtraOption') bool? isExtraOption
});




}
/// @nodoc
class __$FormFieldOptionCopyWithImpl<$Res>
    implements _$FormFieldOptionCopyWith<$Res> {
  __$FormFieldOptionCopyWithImpl(this._self, this._then);

  final _FormFieldOption _self;
  final $Res Function(_FormFieldOption) _then;

/// Create a copy of FormFieldOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? label = freezed,Object? isExtraOption = freezed,}) {
  return _then(_FormFieldOption(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,isExtraOption: freezed == isExtraOption ? _self.isExtraOption : isExtraOption // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
