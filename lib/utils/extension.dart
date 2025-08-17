// ------
import 'dart:ui';

extension FirstWhereOrNull<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

// String
extension StringExtension on String {
  String removeVietnameseSigns() {
    return toLowerCase()
        .trim()
        .replaceAll(RegExp("á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ"), 'a')
        .replaceAll(RegExp("é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ"), 'e')
        .replaceAll(RegExp("i|í|ì|ỉ|ĩ|ị"), 'i')
        .replaceAll(RegExp("ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ"), 'o')
        .replaceAll(RegExp("ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự"), 'u')
        .replaceAll(RegExp("ý|ỳ|ỷ|ỹ|ỵ"), 'y')
        .replaceAll(RegExp("đ"), 'd');
  }

  // Example: 'hello world' -> 'Hello world'
  String toTitleCase() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  /// Example: '  hello   world  ' -> 'Hello World'
  String toCapitalizedString() => trim()
      .replaceAll(RegExp(r' +'), ' ')
      .split(' ')
      .map((str) => str.toTitleCase())
      .join(' ');
}

// Color
extension ColorOpacityExtension on Color {
  Color withOpacityFraction(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((opacity * 255).round());
  }
}
