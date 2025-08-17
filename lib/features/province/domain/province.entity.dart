// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'province.entity.freezed.dart';
part 'province.entity.g.dart';

@freezed
abstract class Province with _$Province {
  const factory Province({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'sort_order') int? sortOrder,
    @JsonKey(name: 'zip_code') String? zipCode,
    @JsonKey(name: 'phone_code') String? phoneCode,
    @JsonKey(name: 'is_status') int? isStatus,
  }) = _Province;

  factory Province.fromJson(Map<String, Object?> json) =>
      _$ProvinceFromJson(json);
}