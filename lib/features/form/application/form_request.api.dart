import 'dart:convert';
import 'package:http/http.dart';
import 'package:dynamicform/application/utils/rest_transport.dart';
import 'package:dynamicform/domain/main.entity.dart';

final RestTransport restTransport = RestTransport();

/// Lấy thông tin FormRequest theo ID
Future<Response> getFormRequest({
  required String id,
  ReqQuery? query,
  ReqHeaderConfig? headerConfig,
}) async {
  // Lấy URL đầy đủ
  final uri = await getApiUri(path: '/form-requests/$id', params: query);

  // Lấy header đầy đủ (token tự động từ SharedPrefs + config truyền vào)
  // final headersConfig = await getReqHeaderConfig(headerConfig);

  // Fake token
  const fakeToken = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTU2NDE2NzksImlzcyI6ImVjb21tZXJjZSIsIklkIjozLCJUeXBlIjoxfQ.x1ktMa-pCTkE75M9e5FUqsboAAfFTqOJ-Um9GiCrNc7UaNzJsAB-z1qc2nywZIxf9ofFIBvKjvyyDSXKuxOmjnvNk1KQzSN3UzGzdXL6zgSOrW0kpg_Y0nueUVsjC1ktACLeGJacSM_HiTnQBFFhciR_ZRR0jCCyZwx-c6n6oJYJfReQqFbXv5YcVvs6vXJXt_sSSPNFxWxJh528wUX9UEQ3OZuCsWCaZnhDV49tyRUOP9DqjGvjGC2ylK7hs1S8z9l1KYknuuJfhtjg30MehPoCSywAv1aQ79gheXrKX_KtlssnRNt6gLrHHM9B0CUM1GuAsn-ubRlFeyDJJcSOvQ';

  final headersConfigs = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $fakeToken',
  };

  // Log request
  print('--- CALL getFormRequest ---');
  print('URL: $uri');
  print('Headers: $headersConfigs');
  if (query != null) print('Query: $query');

  // Gọi API
  final response = await restTransport.get(
    '/form-requests/$id',
    query: query,
    config: headersConfigs,
  );

  // Log response
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
  print('--- END CALL getFormRequest ---');

  return response;
}
