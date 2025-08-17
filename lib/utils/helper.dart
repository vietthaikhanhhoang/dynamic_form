import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dynamicform/domain/main.entity.dart';

getNavigatorBottomHeight({required BuildContext context}) {
  // 80 count form Widget mode on mobile
  return 80;
}

// -------
String mergeAddress({String? address, String? province, String? ward}) {
  final List<String?> items =
      [
        address,
        ward,
        province,
      ].takeWhile((item) => item != null && item.isNotEmpty).toList();

  return items.join(', ');
}

// -------
int parseAlpha(double opacity) => (255 * opacity).round();

// ------
bool isCallAPIStatusSuccess(ResStatusEnum? status) {
  return (status == ResStatusEnum.SUCCESS || status == ResStatusEnum.success);
}

bool isCallAPIStatusError(ResStatusEnum? status) {
  return (status == ResStatusEnum.error || status == ResStatusEnum.error);
}

bool isEnvProduct() => dotenv.getBool('IS_ENV_PRODUCT', fallback: false);
