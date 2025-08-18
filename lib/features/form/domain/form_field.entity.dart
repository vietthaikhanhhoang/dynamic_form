// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_field.entity.freezed.dart';
part 'form_field.entity.g.dart';

@freezed
abstract class FormFieldEntity with _$FormFieldEntity {
  const factory FormFieldEntity({
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'label') String? label,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'isRequired') bool? isRequired,
    @JsonKey(name: 'nameSaveLabel') String? nameSaveLabel,
    @JsonKey(name: 'nameSaveExtraOption') String? nameSaveExtraOption,
    @JsonKey(name: 'colSm') int? colSm,
    @JsonKey(name: 'colMd') int? colMd,
    @JsonKey(name: 'colLg') int? colLg,
    @JsonKey(name: 'options') List<FormFieldOption>? options,
    @JsonKey(name: 'valueIsArray') bool? valueIsArray,
    @JsonKey(name: 'row') int? row,
    @JsonKey(name: 'max') int? max,

    // 👇 Bổ sung field này
    @JsonKey(name: 'nameFieldDependent') String? nameFieldDependent,
  }) = _FormFieldEntity;

  factory FormFieldEntity.fromJson(Map<String, Object?> json) =>
      _$FormFieldEntityFromJson(json);
}

@freezed
abstract class FormFieldOption with _$FormFieldOption {
  const factory FormFieldOption({
    @JsonKey(name: 'value') String? value,
    @JsonKey(name: 'label') String? label,
    @JsonKey(name: 'isExtraOption') bool? isExtraOption,
  }) = _FormFieldOption;

  factory FormFieldOption.fromJson(Map<String, Object?> json) =>
      _$FormFieldOptionFromJson(json);
}
