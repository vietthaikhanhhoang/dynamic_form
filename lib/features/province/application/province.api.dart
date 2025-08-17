// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:vnpt_self_care/application/utils/rest_transport.dart';
// import 'package:vnpt_self_care/domain/main.entity.dart';
//
// final RestTransport restTransport = RestTransport();
//
// /// Lấy danh sách tất cả provinces từ server kèm log
// Future<Response> geProvinces({
//   ReqQuery? query,
//   ReqHeaderConfig? headerConfig,
// }) async {
//   // Lấy URL đầy đủ
//   final uri = await getApiUri(path: '/provinces-wards/provinces', params: query);
//
//   // Lấy header đầy đủ (token tự động từ SharedPrefs + config truyền vào)
//   final headersConfig = await getReqHeaderConfig(headerConfig);
//
//   print('--- CALL geProvinces ---');
//   print('URL: $uri');
//   print('Headers: $headersConfig');
//   if (query != null) print('Query: $query');
//
//   // Gọi API
//   final response = await restTransport.get(
//     '/provinces-wards/provinces',
//     query: query,
//     config: headerConfig,
//   );
//
//   // Log response
//   print('Status code: ${response.statusCode}');
//   print('Body: ${response.body}');
//   print('--- END CALL geProvinces ---');
//
//   return response;
// }

import 'dart:convert';
import 'package:http/http.dart';
import 'package:dynamicform/application/utils/rest_transport.dart';
import 'package:dynamicform/domain/main.entity.dart';

final RestTransport restTransport = RestTransport();

/// Lấy danh sách tất cả provinces từ server kèm log, fake token
Future<Response> geProvinces({
  ReqQuery? query,
}) async {
  //print("bat dau goi api provinces");
  // Lấy URL đầy đủ
  // final uri = await getApiUri(path: '/provinces-wards/provinces', params: query);
  //print("goi xong");

  // Fake token
  const fakeToken = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTU2NDE2NzksImlzcyI6ImVjb21tZXJjZSIsIklkIjozLCJUeXBlIjoxfQ.x1ktMa-pCTkE75M9e5FUqsboAAfFTqOJ-Um9GiCrNc7UaNzJsAB-z1qc2nywZIxf9ofFIBvKjvyyDSXKuxOmjnvNk1KQzSN3UzGzdXL6zgSOrW0kpg_Y0nueUVsjC1ktACLeGJacSM_HiTnQBFFhciR_ZRR0jCCyZwx-c6n6oJYJfReQqFbXv5YcVvs6vXJXt_sSSPNFxWxJh528wUX9UEQ3OZuCsWCaZnhDV49tyRUOP9DqjGvjGC2ylK7hs1S8z9l1KYknuuJfhtjg30MehPoCSywAv1aQ79gheXrKX_KtlssnRNt6gLrHHM9B0CUM1GuAsn-ubRlFeyDJJcSOvQ';

  final headersConfigs = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $fakeToken',
  };

  // Log request
  print('--- CALL geProvinces ---');
  // print('URL: $uri');
  print('Headers: $headersConfigs');
  if (query != null) print('Query: $query');

  // Gọi API
  final response = await restTransport.get(
    '/provinces-wards/provinces',
    query: query,
    config: headersConfigs,
  );

  // Log response
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
  print('--- END CALL geProvinces ---');

  return response;
}

