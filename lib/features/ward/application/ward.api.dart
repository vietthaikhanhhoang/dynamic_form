import 'dart:convert';
import 'package:http/http.dart';
import 'package:dynamicform/application/utils/rest_transport.dart';
import 'package:dynamicform/domain/main.entity.dart';

final RestTransport restTransport = RestTransport();

/// Lấy danh sách tất cả wards từ server theo province_code, fake token
Future<Response> getWards({
  required String provinceCode,
  ReqQuery? query,
}) async {
  // Thêm province_code vào query
  final mergedQuery = {
    'province_id': provinceCode,
    if (query != null) ...query,
  };

  // Lấy URL đầy đủ
  final uri = await getApiUri(
    path: '/provinces-wards/wards',
    params: mergedQuery,
  );

  // Fake token
  const fakeToken =
      'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTU2NDA2NDAsImlzcyI6ImVjb21tZXJjZSIsIklkIjozLCJUeXBlIjoxfQ.TzN913UBeLW-zsJTtEE5UuMhToC_fxM2HFINwoxn_KZ5JiN5_dkEfV9JRegjLEY3FclKXuBB6hzsUSfK510UPJaBeNmmWi226RBGR1aJWu5BfAZy85iHRdzyfV6A_WHdWpRP-4aIFKnrIrMup7gd67rjctkUiGS8WTastKeJ08nrU3qPoD4HZZp9sWPWEK0qrzDNzx1_ZxHnPW6tsowR5YlxKR783FC7G9Q7yibfRVsW119XePUgZA2dmq_jJDCr898g2DKMXRV8MoGKkbc8TnXr8fIqYM4sHyb71CV4JNm0oQ5srYREyI0Mb5R8hx536PUp3JREqGc50qXD1tbxqA';

  final headersConfig = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $fakeToken',
  };

  // Log request
  // print('--- CALL getWards ---');
  // print('URL: $uri');
  // print('Headers: $headersConfig');
  // print('Query: $mergedQuery');

  // Gọi API
  final response = await restTransport.get(
    '/provinces-wards/wards',
    query: mergedQuery,
    config: headersConfig,
  );

  // Log response
  // print('Status code: ${response.statusCode}');
  // print('Body: ${response.body}');
  // print('--- END CALL getWards ---');

  return response;
}
