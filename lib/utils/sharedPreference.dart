import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Một lớp tiện ích để đóng gói các hàm cơ bản của SharedPreferences.
///
/// Lớp này giúp việc lưu, đọc, và xóa dữ liệu trở nên gọn gàng và dễ dàng hơn,
/// đặc biệt là với các đối tượng phức tạp (được tự động mã hóa/giải mã JSON).
class SharedPrefs {
  /// Phương thức để lấy một chuỗi từ SharedPreferences.
  static Future<String?> getString(String key) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }

  static Future<bool?> setString(String key, String value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(key, value);
  }

  ///
  static Future<bool?> getBool(String key) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(key);
  }

  static Future<bool?> setBool(String key, bool value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool(key, value);
  }

  ///
  static Future<int?> getInt(String key) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt(key);
  }

  static Future<bool?> setInt(String key, int value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setInt(key, value);
  }

  ///
  static Future<double?> getDecimal(String key) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getDouble(key);
  }

  static Future<bool?> setDecial(String key, double value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setDouble(key, value);
  }

  /// Phương thức để lấy một đối tượng phức tạp từ SharedPreferences.
  /// Đối tượng sẽ được giải mã từ chuỗi JSON.
  static Future<T?> getObject<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final _prefs = await SharedPreferences.getInstance();
    final jsonString = _prefs.getString(key);

    if (jsonString == null) {
      return null;
    }
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return fromJson(jsonMap);
  }

  static Future<bool> setObject<T>(
    String key,
    T object,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    final _prefs = await SharedPreferences.getInstance();
    final jsonMap = toJson(object);
    final jsonString = jsonEncode(jsonMap);
    return _prefs.setString(key, jsonString);
  }

  /// Phương thức để xóa một khóa và giá trị tương ứng.
  static Future<bool> remove(String key) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.remove(key);
  }

  /// Phương thức để xóa tất cả các khóa và giá trị trong SharedPreferences.
  static Future<bool> clearAll() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.clear();
  }

  /// Phương thức để kiểm tra xem một khóa có tồn tại hay không.
  static Future<bool> containsKey(String key) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.containsKey(key);
  }
}
