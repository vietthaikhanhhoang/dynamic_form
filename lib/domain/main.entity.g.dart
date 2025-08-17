// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResBase _$ResBaseFromJson(Map<String, dynamic> json) => _ResBase(
  message: json['message'] as String?,
  status: $enumDecodeNullable(_$ResStatusEnumEnumMap, json['status']),
);

Map<String, dynamic> _$ResBaseToJson(_ResBase instance) => <String, dynamic>{
  'message': instance.message,
  'status': _$ResStatusEnumEnumMap[instance.status],
};

const _$ResStatusEnumEnumMap = {
  ResStatusEnum.success: 'success',
  ResStatusEnum.SUCCESS: 'SUCCESS',
  ResStatusEnum.error: 'error',
  ResStatusEnum.ERROR: 'ERROR',
};

_ResFindManyData<T> _$ResFindManyDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ResFindManyData<T>(
  currentPage: (json['current_page'] as num).toInt(),
  items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
  pageSize: (json['page_size'] as num).toInt(),
  totalItems: (json['total_items'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
);

Map<String, dynamic> _$ResFindManyDataToJson<T>(
  _ResFindManyData<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'items': instance.items?.map(toJsonT).toList(),
  'page_size': instance.pageSize,
  'total_items': instance.totalItems,
  'total_pages': instance.totalPages,
};

_ResFindOne<T> _$ResFindOneFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ResFindOne<T>(
  message: json['message'] as String?,
  status: $enumDecodeNullable(_$ResStatusEnumEnumMap, json['status']),
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$ResFindOneToJson<T>(
  _ResFindOne<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'message': instance.message,
  'status': _$ResStatusEnumEnumMap[instance.status],
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_ResCUD<T> _$ResCUDFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ResCUD<T>(
  message: json['message'] as String?,
  status: $enumDecodeNullable(_$ResStatusEnumEnumMap, json['status']),
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$ResCUDToJson<T>(
  _ResCUD<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'message': instance.message,
  'status': _$ResStatusEnumEnumMap[instance.status],
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

_BodyDeleteMany _$BodyDeleteManyFromJson(
  Map<String, dynamic> json,
) => _BodyDeleteMany(
  ids: (json['ids'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$BodyDeleteManyToJson(_BodyDeleteMany instance) =>
    <String, dynamic>{'ids': instance.ids};

_OptionSelect _$OptionSelectFromJson(Map<String, dynamic> json) =>
    _OptionSelect(
      label: json['label'] as String,
      value: json['value'] as Object,
    );

Map<String, dynamic> _$OptionSelectToJson(_OptionSelect instance) =>
    <String, dynamic>{'label': instance.label, 'value': instance.value};
