// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'form_field.entity.dart';

part 'form_request.entity.freezed.dart';
part 'form_request.entity.g.dart';

@freezed
abstract class FormRequest with _$FormRequest {
  const factory FormRequest({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'data') List<FormFieldEntity>? data,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _FormRequest;

  factory FormRequest.fromJson(Map<String, Object?> json) =>
      _$FormRequestFromJson(json);
}
