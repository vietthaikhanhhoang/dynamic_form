// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'ward.entity.freezed.dart';
part 'ward.entity.g.dart';

@freezed
abstract class Ward with _$Ward {
  const factory Ward({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'province_id') int? provinceId,
    @JsonKey(name: 'sort_order') int? sortOrder,
    @JsonKey(name: 'zip_code') String? zipCode,
    @JsonKey(name: 'phone_code') String? phoneCode,
    @JsonKey(name: 'is_status') int? isStatus,
  }) = _Ward;

  factory Ward.fromJson(Map<String, Object?> json) =>
      _$WardFromJson(json);
}
