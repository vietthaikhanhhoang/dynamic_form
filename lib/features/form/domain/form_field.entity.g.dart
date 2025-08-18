// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_field.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormFieldEntity _$FormFieldEntityFromJson(Map<String, dynamic> json) =>
    _FormFieldEntity(
      type: json['type'] as String?,
      label: json['label'] as String?,
      name: json['name'] as String?,
      isRequired: json['isRequired'] as bool?,
      nameSaveLabel: json['nameSaveLabel'] as String?,
      nameSaveExtraOption: json['nameSaveExtraOption'] as String?,
      colSm: (json['colSm'] as num?)?.toInt(),
      colMd: (json['colMd'] as num?)?.toInt(),
      colLg: (json['colLg'] as num?)?.toInt(),
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => FormFieldOption.fromJson(e as Map<String, dynamic>))
              .toList(),
      valueIsArray: json['valueIsArray'] as bool?,
      row: (json['row'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      nameFieldDependent: json['nameFieldDependent'] as String?,
    );

Map<String, dynamic> _$FormFieldEntityToJson(_FormFieldEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'name': instance.name,
      'isRequired': instance.isRequired,
      'nameSaveLabel': instance.nameSaveLabel,
      'nameSaveExtraOption': instance.nameSaveExtraOption,
      'colSm': instance.colSm,
      'colMd': instance.colMd,
      'colLg': instance.colLg,
      'options': instance.options,
      'valueIsArray': instance.valueIsArray,
      'row': instance.row,
      'max': instance.max,
      'nameFieldDependent': instance.nameFieldDependent,
    };

_FormFieldOption _$FormFieldOptionFromJson(Map<String, dynamic> json) =>
    _FormFieldOption(
      value: json['value'] as String?,
      label: json['label'] as String?,
      isExtraOption: json['isExtraOption'] as bool?,
    );

Map<String, dynamic> _$FormFieldOptionToJson(_FormFieldOption instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'isExtraOption': instance.isExtraOption,
    };
