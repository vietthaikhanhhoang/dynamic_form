// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResBase implements DiagnosticableTreeMixin {

 String? get message; ResStatusEnum? get status;
/// Create a copy of ResBase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResBaseCopyWith<ResBase> get copyWith => _$ResBaseCopyWithImpl<ResBase>(this as ResBase, _$identity);

  /// Serializes this ResBase to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResBase'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('status', status));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResBase&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,status);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResBase(message: $message, status: $status)';
}


}

/// @nodoc
abstract mixin class $ResBaseCopyWith<$Res>  {
  factory $ResBaseCopyWith(ResBase value, $Res Function(ResBase) _then) = _$ResBaseCopyWithImpl;
@useResult
$Res call({
 String? message, ResStatusEnum? status
});




}
/// @nodoc
class _$ResBaseCopyWithImpl<$Res>
    implements $ResBaseCopyWith<$Res> {
  _$ResBaseCopyWithImpl(this._self, this._then);

  final ResBase _self;
  final $Res Function(ResBase) _then;

/// Create a copy of ResBase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResStatusEnum?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResBase].
extension ResBasePatterns on ResBase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResBase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResBase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResBase value)  $default,){
final _that = this;
switch (_that) {
case _ResBase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResBase value)?  $default,){
final _that = this;
switch (_that) {
case _ResBase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  ResStatusEnum? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResBase() when $default != null:
return $default(_that.message,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  ResStatusEnum? status)  $default,) {final _that = this;
switch (_that) {
case _ResBase():
return $default(_that.message,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  ResStatusEnum? status)?  $default,) {final _that = this;
switch (_that) {
case _ResBase() when $default != null:
return $default(_that.message,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResBase with DiagnosticableTreeMixin implements ResBase {
  const _ResBase({this.message, this.status});
  factory _ResBase.fromJson(Map<String, dynamic> json) => _$ResBaseFromJson(json);

@override final  String? message;
@override final  ResStatusEnum? status;

/// Create a copy of ResBase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResBaseCopyWith<_ResBase> get copyWith => __$ResBaseCopyWithImpl<_ResBase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResBaseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResBase'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('status', status));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResBase&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,status);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResBase(message: $message, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ResBaseCopyWith<$Res> implements $ResBaseCopyWith<$Res> {
  factory _$ResBaseCopyWith(_ResBase value, $Res Function(_ResBase) _then) = __$ResBaseCopyWithImpl;
@override @useResult
$Res call({
 String? message, ResStatusEnum? status
});




}
/// @nodoc
class __$ResBaseCopyWithImpl<$Res>
    implements _$ResBaseCopyWith<$Res> {
  __$ResBaseCopyWithImpl(this._self, this._then);

  final _ResBase _self;
  final $Res Function(_ResBase) _then;

/// Create a copy of ResBase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? status = freezed,}) {
  return _then(_ResBase(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResStatusEnum?,
  ));
}


}


/// @nodoc
mixin _$ResFindManyData<T> implements DiagnosticableTreeMixin {

@JsonKey(name: 'current_page') int get currentPage; List<T>? get items;@JsonKey(name: 'page_size') int get pageSize;@JsonKey(name: 'total_items') int get totalItems;@JsonKey(name: 'total_pages') int get totalPages;
/// Create a copy of ResFindManyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResFindManyDataCopyWith<T, ResFindManyData<T>> get copyWith => _$ResFindManyDataCopyWithImpl<T, ResFindManyData<T>>(this as ResFindManyData<T>, _$identity);

  /// Serializes this ResFindManyData to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindManyData<$T>'))
    ..add(DiagnosticsProperty('currentPage', currentPage))..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('pageSize', pageSize))..add(DiagnosticsProperty('totalItems', totalItems))..add(DiagnosticsProperty('totalPages', totalPages));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResFindManyData<T>&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(items),pageSize,totalItems,totalPages);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindManyData<$T>(currentPage: $currentPage, items: $items, pageSize: $pageSize, totalItems: $totalItems, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ResFindManyDataCopyWith<T,$Res>  {
  factory $ResFindManyDataCopyWith(ResFindManyData<T> value, $Res Function(ResFindManyData<T>) _then) = _$ResFindManyDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<T>? items,@JsonKey(name: 'page_size') int pageSize,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'total_pages') int totalPages
});




}
/// @nodoc
class _$ResFindManyDataCopyWithImpl<T,$Res>
    implements $ResFindManyDataCopyWith<T, $Res> {
  _$ResFindManyDataCopyWithImpl(this._self, this._then);

  final ResFindManyData<T> _self;
  final $Res Function(ResFindManyData<T>) _then;

/// Create a copy of ResFindManyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? items = freezed,Object? pageSize = null,Object? totalItems = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>?,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ResFindManyData].
extension ResFindManyDataPatterns<T> on ResFindManyData<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResFindManyData<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResFindManyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResFindManyData<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResFindManyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResFindManyData<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResFindManyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<T>? items, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'total_pages')  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResFindManyData() when $default != null:
return $default(_that.currentPage,_that.items,_that.pageSize,_that.totalItems,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<T>? items, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'total_pages')  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _ResFindManyData():
return $default(_that.currentPage,_that.items,_that.pageSize,_that.totalItems,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage,  List<T>? items, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'total_pages')  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _ResFindManyData() when $default != null:
return $default(_that.currentPage,_that.items,_that.pageSize,_that.totalItems,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ResFindManyData<T> with DiagnosticableTreeMixin implements ResFindManyData<T> {
  const _ResFindManyData({@JsonKey(name: 'current_page') required this.currentPage, final  List<T>? items, @JsonKey(name: 'page_size') required this.pageSize, @JsonKey(name: 'total_items') required this.totalItems, @JsonKey(name: 'total_pages') required this.totalPages}): _items = items;
  factory _ResFindManyData.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ResFindManyDataFromJson(json,fromJsonT);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<T>? _items;
@override List<T>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'page_size') final  int pageSize;
@override@JsonKey(name: 'total_items') final  int totalItems;
@override@JsonKey(name: 'total_pages') final  int totalPages;

/// Create a copy of ResFindManyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResFindManyDataCopyWith<T, _ResFindManyData<T>> get copyWith => __$ResFindManyDataCopyWithImpl<T, _ResFindManyData<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ResFindManyDataToJson<T>(this, toJsonT);
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindManyData<$T>'))
    ..add(DiagnosticsProperty('currentPage', currentPage))..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('pageSize', pageSize))..add(DiagnosticsProperty('totalItems', totalItems))..add(DiagnosticsProperty('totalPages', totalPages));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResFindManyData<T>&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_items),pageSize,totalItems,totalPages);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindManyData<$T>(currentPage: $currentPage, items: $items, pageSize: $pageSize, totalItems: $totalItems, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$ResFindManyDataCopyWith<T,$Res> implements $ResFindManyDataCopyWith<T, $Res> {
  factory _$ResFindManyDataCopyWith(_ResFindManyData<T> value, $Res Function(_ResFindManyData<T>) _then) = __$ResFindManyDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<T>? items,@JsonKey(name: 'page_size') int pageSize,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'total_pages') int totalPages
});




}
/// @nodoc
class __$ResFindManyDataCopyWithImpl<T,$Res>
    implements _$ResFindManyDataCopyWith<T, $Res> {
  __$ResFindManyDataCopyWithImpl(this._self, this._then);

  final _ResFindManyData<T> _self;
  final $Res Function(_ResFindManyData<T>) _then;

/// Create a copy of ResFindManyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? items = freezed,Object? pageSize = null,Object? totalItems = null,Object? totalPages = null,}) {
  return _then(_ResFindManyData<T>(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>?,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ResFindMany<T> implements DiagnosticableTreeMixin {

 String? get message; ResStatusEnum? get status; ResFindManyData<T> get data;
/// Create a copy of ResFindMany
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResFindManyCopyWith<T, ResFindMany<T>> get copyWith => _$ResFindManyCopyWithImpl<T, ResFindMany<T>>(this as ResFindMany<T>, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindMany<$T>'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResFindMany<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,message,status,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindMany<$T>(message: $message, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ResFindManyCopyWith<T,$Res>  {
  factory $ResFindManyCopyWith(ResFindMany<T> value, $Res Function(ResFindMany<T>) _then) = _$ResFindManyCopyWithImpl;
@useResult
$Res call({
 String? message, ResStatusEnum? status, ResFindManyData<T> data
});


$ResFindManyDataCopyWith<T, $Res> get data;

}
/// @nodoc
class _$ResFindManyCopyWithImpl<T,$Res>
    implements $ResFindManyCopyWith<T, $Res> {
  _$ResFindManyCopyWithImpl(this._self, this._then);

  final ResFindMany<T> _self;
  final $Res Function(ResFindMany<T>) _then;

/// Create a copy of ResFindMany
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? status = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResStatusEnum?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ResFindManyData<T>,
  ));
}
/// Create a copy of ResFindMany
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResFindManyDataCopyWith<T, $Res> get data {
  
  return $ResFindManyDataCopyWith<T, $Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResFindMany].
extension ResFindManyPatterns<T> on ResFindMany<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResFindMany<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResFindMany() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResFindMany<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResFindMany():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResFindMany<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResFindMany() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  ResStatusEnum? status,  ResFindManyData<T> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResFindMany() when $default != null:
return $default(_that.message,_that.status,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  ResStatusEnum? status,  ResFindManyData<T> data)  $default,) {final _that = this;
switch (_that) {
case _ResFindMany():
return $default(_that.message,_that.status,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  ResStatusEnum? status,  ResFindManyData<T> data)?  $default,) {final _that = this;
switch (_that) {
case _ResFindMany() when $default != null:
return $default(_that.message,_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _ResFindMany<T> with DiagnosticableTreeMixin implements ResFindMany<T> {
  const _ResFindMany({this.message, this.status, required this.data});
  

@override final  String? message;
@override final  ResStatusEnum? status;
@override final  ResFindManyData<T> data;

/// Create a copy of ResFindMany
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResFindManyCopyWith<T, _ResFindMany<T>> get copyWith => __$ResFindManyCopyWithImpl<T, _ResFindMany<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindMany<$T>'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResFindMany<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,message,status,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindMany<$T>(message: $message, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ResFindManyCopyWith<T,$Res> implements $ResFindManyCopyWith<T, $Res> {
  factory _$ResFindManyCopyWith(_ResFindMany<T> value, $Res Function(_ResFindMany<T>) _then) = __$ResFindManyCopyWithImpl;
@override @useResult
$Res call({
 String? message, ResStatusEnum? status, ResFindManyData<T> data
});


@override $ResFindManyDataCopyWith<T, $Res> get data;

}
/// @nodoc
class __$ResFindManyCopyWithImpl<T,$Res>
    implements _$ResFindManyCopyWith<T, $Res> {
  __$ResFindManyCopyWithImpl(this._self, this._then);

  final _ResFindMany<T> _self;
  final $Res Function(_ResFindMany<T>) _then;

/// Create a copy of ResFindMany
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? status = freezed,Object? data = null,}) {
  return _then(_ResFindMany<T>(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResStatusEnum?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ResFindManyData<T>,
  ));
}

/// Create a copy of ResFindMany
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResFindManyDataCopyWith<T, $Res> get data {
  
  return $ResFindManyDataCopyWith<T, $Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ResFindOne<T> implements DiagnosticableTreeMixin {

 String? get message; ResStatusEnum? get status; T? get data;
/// Create a copy of ResFindOne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResFindOneCopyWith<T, ResFindOne<T>> get copyWith => _$ResFindOneCopyWithImpl<T, ResFindOne<T>>(this as ResFindOne<T>, _$identity);

  /// Serializes this ResFindOne to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindOne<$T>'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResFindOne<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,status,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindOne<$T>(message: $message, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ResFindOneCopyWith<T,$Res>  {
  factory $ResFindOneCopyWith(ResFindOne<T> value, $Res Function(ResFindOne<T>) _then) = _$ResFindOneCopyWithImpl;
@useResult
$Res call({
 String? message, ResStatusEnum? status, T? data
});




}
/// @nodoc
class _$ResFindOneCopyWithImpl<T,$Res>
    implements $ResFindOneCopyWith<T, $Res> {
  _$ResFindOneCopyWithImpl(this._self, this._then);

  final ResFindOne<T> _self;
  final $Res Function(ResFindOne<T>) _then;

/// Create a copy of ResFindOne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? status = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResStatusEnum?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResFindOne].
extension ResFindOnePatterns<T> on ResFindOne<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResFindOne<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResFindOne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResFindOne<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResFindOne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResFindOne<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResFindOne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  ResStatusEnum? status,  T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResFindOne() when $default != null:
return $default(_that.message,_that.status,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  ResStatusEnum? status,  T? data)  $default,) {final _that = this;
switch (_that) {
case _ResFindOne():
return $default(_that.message,_that.status,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  ResStatusEnum? status,  T? data)?  $default,) {final _that = this;
switch (_that) {
case _ResFindOne() when $default != null:
return $default(_that.message,_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ResFindOne<T> with DiagnosticableTreeMixin implements ResFindOne<T> {
  const _ResFindOne({this.message, this.status, this.data});
  factory _ResFindOne.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ResFindOneFromJson(json,fromJsonT);

@override final  String? message;
@override final  ResStatusEnum? status;
@override final  T? data;

/// Create a copy of ResFindOne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResFindOneCopyWith<T, _ResFindOne<T>> get copyWith => __$ResFindOneCopyWithImpl<T, _ResFindOne<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ResFindOneToJson<T>(this, toJsonT);
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindOne<$T>'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResFindOne<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,status,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindOne<$T>(message: $message, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ResFindOneCopyWith<T,$Res> implements $ResFindOneCopyWith<T, $Res> {
  factory _$ResFindOneCopyWith(_ResFindOne<T> value, $Res Function(_ResFindOne<T>) _then) = __$ResFindOneCopyWithImpl;
@override @useResult
$Res call({
 String? message, ResStatusEnum? status, T? data
});




}
/// @nodoc
class __$ResFindOneCopyWithImpl<T,$Res>
    implements _$ResFindOneCopyWith<T, $Res> {
  __$ResFindOneCopyWithImpl(this._self, this._then);

  final _ResFindOne<T> _self;
  final $Res Function(_ResFindOne<T>) _then;

/// Create a copy of ResFindOne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? status = freezed,Object? data = freezed,}) {
  return _then(_ResFindOne<T>(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResStatusEnum?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}


/// @nodoc
mixin _$ResCUD<T> implements DiagnosticableTreeMixin {

 String? get message; ResStatusEnum? get status; T? get data;
/// Create a copy of ResCUD
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResCUDCopyWith<T, ResCUD<T>> get copyWith => _$ResCUDCopyWithImpl<T, ResCUD<T>>(this as ResCUD<T>, _$identity);

  /// Serializes this ResCUD to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResCUD<$T>'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResCUD<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,status,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResCUD<$T>(message: $message, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ResCUDCopyWith<T,$Res>  {
  factory $ResCUDCopyWith(ResCUD<T> value, $Res Function(ResCUD<T>) _then) = _$ResCUDCopyWithImpl;
@useResult
$Res call({
 String? message, ResStatusEnum? status, T? data
});




}
/// @nodoc
class _$ResCUDCopyWithImpl<T,$Res>
    implements $ResCUDCopyWith<T, $Res> {
  _$ResCUDCopyWithImpl(this._self, this._then);

  final ResCUD<T> _self;
  final $Res Function(ResCUD<T>) _then;

/// Create a copy of ResCUD
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? status = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResStatusEnum?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResCUD].
extension ResCUDPatterns<T> on ResCUD<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResCUD<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResCUD() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResCUD<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResCUD():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResCUD<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResCUD() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  ResStatusEnum? status,  T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResCUD() when $default != null:
return $default(_that.message,_that.status,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  ResStatusEnum? status,  T? data)  $default,) {final _that = this;
switch (_that) {
case _ResCUD():
return $default(_that.message,_that.status,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  ResStatusEnum? status,  T? data)?  $default,) {final _that = this;
switch (_that) {
case _ResCUD() when $default != null:
return $default(_that.message,_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ResCUD<T> with DiagnosticableTreeMixin implements ResCUD<T> {
  const _ResCUD({this.message, this.status, this.data});
  factory _ResCUD.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ResCUDFromJson(json,fromJsonT);

@override final  String? message;
@override final  ResStatusEnum? status;
@override final  T? data;

/// Create a copy of ResCUD
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResCUDCopyWith<T, _ResCUD<T>> get copyWith => __$ResCUDCopyWithImpl<T, _ResCUD<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ResCUDToJson<T>(this, toJsonT);
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResCUD<$T>'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResCUD<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,status,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResCUD<$T>(message: $message, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ResCUDCopyWith<T,$Res> implements $ResCUDCopyWith<T, $Res> {
  factory _$ResCUDCopyWith(_ResCUD<T> value, $Res Function(_ResCUD<T>) _then) = __$ResCUDCopyWithImpl;
@override @useResult
$Res call({
 String? message, ResStatusEnum? status, T? data
});




}
/// @nodoc
class __$ResCUDCopyWithImpl<T,$Res>
    implements _$ResCUDCopyWith<T, $Res> {
  __$ResCUDCopyWithImpl(this._self, this._then);

  final _ResCUD<T> _self;
  final $Res Function(_ResCUD<T>) _then;

/// Create a copy of ResCUD
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? status = freezed,Object? data = freezed,}) {
  return _then(_ResCUD<T>(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResStatusEnum?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}


/// @nodoc
mixin _$BodyDeleteMany implements DiagnosticableTreeMixin {

 List<int> get ids;
/// Create a copy of BodyDeleteMany
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BodyDeleteManyCopyWith<BodyDeleteMany> get copyWith => _$BodyDeleteManyCopyWithImpl<BodyDeleteMany>(this as BodyDeleteMany, _$identity);

  /// Serializes this BodyDeleteMany to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BodyDeleteMany'))
    ..add(DiagnosticsProperty('ids', ids));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BodyDeleteMany&&const DeepCollectionEquality().equals(other.ids, ids));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ids));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BodyDeleteMany(ids: $ids)';
}


}

/// @nodoc
abstract mixin class $BodyDeleteManyCopyWith<$Res>  {
  factory $BodyDeleteManyCopyWith(BodyDeleteMany value, $Res Function(BodyDeleteMany) _then) = _$BodyDeleteManyCopyWithImpl;
@useResult
$Res call({
 List<int> ids
});




}
/// @nodoc
class _$BodyDeleteManyCopyWithImpl<$Res>
    implements $BodyDeleteManyCopyWith<$Res> {
  _$BodyDeleteManyCopyWithImpl(this._self, this._then);

  final BodyDeleteMany _self;
  final $Res Function(BodyDeleteMany) _then;

/// Create a copy of BodyDeleteMany
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ids = null,}) {
  return _then(_self.copyWith(
ids: null == ids ? _self.ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [BodyDeleteMany].
extension BodyDeleteManyPatterns on BodyDeleteMany {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BodyDeleteMany value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BodyDeleteMany() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BodyDeleteMany value)  $default,){
final _that = this;
switch (_that) {
case _BodyDeleteMany():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BodyDeleteMany value)?  $default,){
final _that = this;
switch (_that) {
case _BodyDeleteMany() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> ids)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BodyDeleteMany() when $default != null:
return $default(_that.ids);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> ids)  $default,) {final _that = this;
switch (_that) {
case _BodyDeleteMany():
return $default(_that.ids);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> ids)?  $default,) {final _that = this;
switch (_that) {
case _BodyDeleteMany() when $default != null:
return $default(_that.ids);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BodyDeleteMany with DiagnosticableTreeMixin implements BodyDeleteMany {
  const _BodyDeleteMany({required final  List<int> ids}): _ids = ids;
  factory _BodyDeleteMany.fromJson(Map<String, dynamic> json) => _$BodyDeleteManyFromJson(json);

 final  List<int> _ids;
@override List<int> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}


/// Create a copy of BodyDeleteMany
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BodyDeleteManyCopyWith<_BodyDeleteMany> get copyWith => __$BodyDeleteManyCopyWithImpl<_BodyDeleteMany>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BodyDeleteManyToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BodyDeleteMany'))
    ..add(DiagnosticsProperty('ids', ids));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BodyDeleteMany&&const DeepCollectionEquality().equals(other._ids, _ids));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ids));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BodyDeleteMany(ids: $ids)';
}


}

/// @nodoc
abstract mixin class _$BodyDeleteManyCopyWith<$Res> implements $BodyDeleteManyCopyWith<$Res> {
  factory _$BodyDeleteManyCopyWith(_BodyDeleteMany value, $Res Function(_BodyDeleteMany) _then) = __$BodyDeleteManyCopyWithImpl;
@override @useResult
$Res call({
 List<int> ids
});




}
/// @nodoc
class __$BodyDeleteManyCopyWithImpl<$Res>
    implements _$BodyDeleteManyCopyWith<$Res> {
  __$BodyDeleteManyCopyWithImpl(this._self, this._then);

  final _BodyDeleteMany _self;
  final $Res Function(_BodyDeleteMany) _then;

/// Create a copy of BodyDeleteMany
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ids = null,}) {
  return _then(_BodyDeleteMany(
ids: null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
mixin _$ResFindManyState<T> implements DiagnosticableTreeMixin {

 List<T> get data; bool get isLoading; ReqQuery? get query; String? get error;
/// Create a copy of ResFindManyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResFindManyStateCopyWith<T, ResFindManyState<T>> get copyWith => _$ResFindManyStateCopyWithImpl<T, ResFindManyState<T>>(this as ResFindManyState<T>, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindManyState<$T>'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('query', query))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResFindManyState<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.query, query)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),isLoading,const DeepCollectionEquality().hash(query),error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindManyState<$T>(data: $data, isLoading: $isLoading, query: $query, error: $error)';
}


}

/// @nodoc
abstract mixin class $ResFindManyStateCopyWith<T,$Res>  {
  factory $ResFindManyStateCopyWith(ResFindManyState<T> value, $Res Function(ResFindManyState<T>) _then) = _$ResFindManyStateCopyWithImpl;
@useResult
$Res call({
 List<T> data, bool isLoading, ReqQuery? query, String? error
});




}
/// @nodoc
class _$ResFindManyStateCopyWithImpl<T,$Res>
    implements $ResFindManyStateCopyWith<T, $Res> {
  _$ResFindManyStateCopyWithImpl(this._self, this._then);

  final ResFindManyState<T> _self;
  final $Res Function(ResFindManyState<T>) _then;

/// Create a copy of ResFindManyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? isLoading = null,Object? query = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as ReqQuery?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResFindManyState].
extension ResFindManyStatePatterns<T> on ResFindManyState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResFindManyState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResFindManyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResFindManyState<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResFindManyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResFindManyState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResFindManyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data,  bool isLoading,  ReqQuery? query,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResFindManyState() when $default != null:
return $default(_that.data,_that.isLoading,_that.query,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data,  bool isLoading,  ReqQuery? query,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ResFindManyState():
return $default(_that.data,_that.isLoading,_that.query,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data,  bool isLoading,  ReqQuery? query,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ResFindManyState() when $default != null:
return $default(_that.data,_that.isLoading,_that.query,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ResFindManyState<T> with DiagnosticableTreeMixin implements ResFindManyState<T> {
  const _ResFindManyState({required final  List<T> data, required this.isLoading, final  ReqQuery? query, this.error}): _data = data,_query = query;
  

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  bool isLoading;
 final  ReqQuery? _query;
@override ReqQuery? get query {
  final value = _query;
  if (value == null) return null;
  if (_query is EqualUnmodifiableMapView) return _query;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? error;

/// Create a copy of ResFindManyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResFindManyStateCopyWith<T, _ResFindManyState<T>> get copyWith => __$ResFindManyStateCopyWithImpl<T, _ResFindManyState<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindManyState<$T>'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('query', query))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResFindManyState<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._query, _query)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),isLoading,const DeepCollectionEquality().hash(_query),error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindManyState<$T>(data: $data, isLoading: $isLoading, query: $query, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ResFindManyStateCopyWith<T,$Res> implements $ResFindManyStateCopyWith<T, $Res> {
  factory _$ResFindManyStateCopyWith(_ResFindManyState<T> value, $Res Function(_ResFindManyState<T>) _then) = __$ResFindManyStateCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, bool isLoading, ReqQuery? query, String? error
});




}
/// @nodoc
class __$ResFindManyStateCopyWithImpl<T,$Res>
    implements _$ResFindManyStateCopyWith<T, $Res> {
  __$ResFindManyStateCopyWithImpl(this._self, this._then);

  final _ResFindManyState<T> _self;
  final $Res Function(_ResFindManyState<T>) _then;

/// Create a copy of ResFindManyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? isLoading = null,Object? query = freezed,Object? error = freezed,}) {
  return _then(_ResFindManyState<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,query: freezed == query ? _self._query : query // ignore: cast_nullable_to_non_nullable
as ReqQuery?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ResFindOneState<T> implements DiagnosticableTreeMixin {

 T get data; bool get isLoading; String? get error;
/// Create a copy of ResFindOneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResFindOneStateCopyWith<T, ResFindOneState<T>> get copyWith => _$ResFindOneStateCopyWithImpl<T, ResFindOneState<T>>(this as ResFindOneState<T>, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindOneState<$T>'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResFindOneState<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),isLoading,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindOneState<$T>(data: $data, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ResFindOneStateCopyWith<T,$Res>  {
  factory $ResFindOneStateCopyWith(ResFindOneState<T> value, $Res Function(ResFindOneState<T>) _then) = _$ResFindOneStateCopyWithImpl;
@useResult
$Res call({
 T data, bool isLoading, String? error
});




}
/// @nodoc
class _$ResFindOneStateCopyWithImpl<T,$Res>
    implements $ResFindOneStateCopyWith<T, $Res> {
  _$ResFindOneStateCopyWithImpl(this._self, this._then);

  final ResFindOneState<T> _self;
  final $Res Function(ResFindOneState<T>) _then;

/// Create a copy of ResFindOneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResFindOneState].
extension ResFindOneStatePatterns<T> on ResFindOneState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResFindOneState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResFindOneState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResFindOneState<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResFindOneState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResFindOneState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResFindOneState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResFindOneState() when $default != null:
return $default(_that.data,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ResFindOneState():
return $default(_that.data,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ResFindOneState() when $default != null:
return $default(_that.data,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ResFindOneState<T> with DiagnosticableTreeMixin implements ResFindOneState<T> {
  const _ResFindOneState({required this.data, required this.isLoading, this.error});
  

@override final  T data;
@override final  bool isLoading;
@override final  String? error;

/// Create a copy of ResFindOneState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResFindOneStateCopyWith<T, _ResFindOneState<T>> get copyWith => __$ResFindOneStateCopyWithImpl<T, _ResFindOneState<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ResFindOneState<$T>'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResFindOneState<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),isLoading,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ResFindOneState<$T>(data: $data, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ResFindOneStateCopyWith<T,$Res> implements $ResFindOneStateCopyWith<T, $Res> {
  factory _$ResFindOneStateCopyWith(_ResFindOneState<T> value, $Res Function(_ResFindOneState<T>) _then) = __$ResFindOneStateCopyWithImpl;
@override @useResult
$Res call({
 T data, bool isLoading, String? error
});




}
/// @nodoc
class __$ResFindOneStateCopyWithImpl<T,$Res>
    implements _$ResFindOneStateCopyWith<T, $Res> {
  __$ResFindOneStateCopyWithImpl(this._self, this._then);

  final _ResFindOneState<T> _self;
  final $Res Function(_ResFindOneState<T>) _then;

/// Create a copy of ResFindOneState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ResFindOneState<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OptionSelect implements DiagnosticableTreeMixin {

 String get label; Object get value;
/// Create a copy of OptionSelect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionSelectCopyWith<OptionSelect> get copyWith => _$OptionSelectCopyWithImpl<OptionSelect>(this as OptionSelect, _$identity);

  /// Serializes this OptionSelect to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OptionSelect'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('value', value));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptionSelect&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,const DeepCollectionEquality().hash(value));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OptionSelect(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class $OptionSelectCopyWith<$Res>  {
  factory $OptionSelectCopyWith(OptionSelect value, $Res Function(OptionSelect) _then) = _$OptionSelectCopyWithImpl;
@useResult
$Res call({
 String label, Object value
});




}
/// @nodoc
class _$OptionSelectCopyWithImpl<$Res>
    implements $OptionSelectCopyWith<$Res> {
  _$OptionSelectCopyWithImpl(this._self, this._then);

  final OptionSelect _self;
  final $Res Function(OptionSelect) _then;

/// Create a copy of OptionSelect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value ,
  ));
}

}


/// Adds pattern-matching-related methods to [OptionSelect].
extension OptionSelectPatterns on OptionSelect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptionSelect value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptionSelect() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptionSelect value)  $default,){
final _that = this;
switch (_that) {
case _OptionSelect():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptionSelect value)?  $default,){
final _that = this;
switch (_that) {
case _OptionSelect() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  Object value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptionSelect() when $default != null:
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  Object value)  $default,) {final _that = this;
switch (_that) {
case _OptionSelect():
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  Object value)?  $default,) {final _that = this;
switch (_that) {
case _OptionSelect() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptionSelect with DiagnosticableTreeMixin implements OptionSelect {
  const _OptionSelect({required this.label, required this.value});
  factory _OptionSelect.fromJson(Map<String, dynamic> json) => _$OptionSelectFromJson(json);

@override final  String label;
@override final  Object value;

/// Create a copy of OptionSelect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionSelectCopyWith<_OptionSelect> get copyWith => __$OptionSelectCopyWithImpl<_OptionSelect>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptionSelectToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OptionSelect'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('value', value));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptionSelect&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,const DeepCollectionEquality().hash(value));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OptionSelect(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$OptionSelectCopyWith<$Res> implements $OptionSelectCopyWith<$Res> {
  factory _$OptionSelectCopyWith(_OptionSelect value, $Res Function(_OptionSelect) _then) = __$OptionSelectCopyWithImpl;
@override @useResult
$Res call({
 String label, Object value
});




}
/// @nodoc
class __$OptionSelectCopyWithImpl<$Res>
    implements _$OptionSelectCopyWith<$Res> {
  __$OptionSelectCopyWithImpl(this._self, this._then);

  final _OptionSelect _self;
  final $Res Function(_OptionSelect) _then;

/// Create a copy of OptionSelect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,}) {
  return _then(_OptionSelect(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value ,
  ));
}


}

// dart format on
