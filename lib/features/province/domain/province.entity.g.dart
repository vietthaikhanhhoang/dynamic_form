// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Province _$ProvinceFromJson(Map<String, dynamic> json) => _Province(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
  type: json['type'] as String?,
  countryId: (json['country_id'] as num?)?.toInt(),
  sortOrder: (json['sort_order'] as num?)?.toInt(),
  zipCode: json['zip_code'] as String?,
  phoneCode: json['phone_code'] as String?,
  isStatus: (json['is_status'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProvinceToJson(_Province instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'type': instance.type,
  'country_id': instance.countryId,
  'sort_order': instance.sortOrder,
  'zip_code': instance.zipCode,
  'phone_code': instance.phoneCode,
  'is_status': instance.isStatus,
};
