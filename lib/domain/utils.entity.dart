part of 'main.entity.dart';

@freezed
abstract class OptionSelect with _$OptionSelect {
  const factory OptionSelect({required String label, required Object value}) =
      _OptionSelect;

  factory OptionSelect.fromJson(Map<String, Object?> json) =>
      _$OptionSelectFromJson(json);
}
