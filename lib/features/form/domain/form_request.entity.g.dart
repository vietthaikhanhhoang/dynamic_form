// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_request.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormRequest _$FormRequestFromJson(Map<String, dynamic> json) => _FormRequest(
  id: json['id'] as String,
  title: json['title'] as String,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => FormFieldEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$FormRequestToJson(_FormRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'data': instance.data,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
