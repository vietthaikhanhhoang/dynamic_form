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
  const fakeToken = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTU2OTc5NDQsImlzcyI6ImVjb21tZXJjZSIsIklkIjozLCJUeXBlIjoxfQ.O33JjU4F8Ip8DCUDELj7hH_I696cJoAKR_X_wjTNCCVqFr-3HQVdPvtVNCcoVb476QAv9Of_UKcC28UtYwIPz0TRyR8JVVIhDw6BSJfDDJH5bDAV6Q2XI5uGa-hslFOH2ePHnyAhGwTUoTuE0JRFNAooa45twGkCycj2HdqFUJTxH8XPhaKchYFEF0-frG4XG1GdJCZ8IpGcWOFMVmAH-Z55WOIDRc4CSjUDQJFYGWy1Q7_FOdPvRrSUsxSPV3xQQtCgWev5eKB883F9mfxfg0Zix1zBTUg-ACjhrN1kaAU11EZsDPgMq1JEWMCY0C52GQScV1gtBR2FpgBUwG-rSA';

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
