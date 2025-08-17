// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:dynamicform/const/const.dart';
import 'package:dynamicform/domain/main.entity.dart';
import 'package:dynamicform/utils/sharedPreference.dart';

class RestTransport {
  get(String path, {ReqHeaderConfig? config, ReqQuery? query}) async {
    var uri = await getApiUri(path: path, params: query);
    var headersConfig = await getReqHeaderConfig(config);

    try {
      return await http.get(uri, headers: headersConfig);
    } catch (e) {
      throw Exception(
        '\n*** client / get *** \n URL: $uri *** \nSomething wrong  \n$e',
      );
    }
  }

  post(String path, {ReqHeaderConfig? config, ReqBody? body}) async {
    var uri = await getApiUri(path: path);
    var headersConfig = await getReqHeaderConfig(config);

    try {
      final res = await http.post(
        uri,
        headers: headersConfig,
        body: jsonEncode(body),
      );

      return res;
    } catch (e) {
      throw Exception(
        '\n*** client / post *** \n URL: $uri *** \nSomething wrong  \n$e',
      );
    }
  }

  put(String path, {ReqHeaderConfig? config, ReqBody? body}) async {
    var uri = await getApiUri(path: path);
    var headersConfig = await getReqHeaderConfig(config);

    try {
      return await http.put(
        uri,
        headers: headersConfig,
        body: jsonEncode(body),
      );
    } catch (e) {
      throw Exception(
        '\n*** client / put *** \n URL: $uri *** \nSomething wrong  \n$e',
      );
    }
  }

  patch(String path, {ReqHeaderConfig? config, ReqBody? body}) async {
    var uri = await getApiUri(path: path);
    var headersConfig = await getReqHeaderConfig(config);

    try {
      return await http.patch(
        uri,
        headers: headersConfig,
        body: jsonEncode(body),
      );
    } catch (e) {
      throw Exception(
        '\n*** client / patch *** \n URL: $uri *** \nSomething wrong  \n$e',
      );
    }
  }

  delete(String path, {ReqHeaderConfig? config, ReqBody? body}) async {
    var uri = await getApiUri(path: path);
    var headersConfig = await getReqHeaderConfig(config);

    try {
      return await http.delete(
        uri,
        headers: headersConfig,
        body: jsonEncode(body),
      );
    } catch (e) {
      throw Exception(
        '\n*** client / delete *** \n URL: $uri *** \nSomething wrong  \n$e',
      );
    }
  }

  postFile(
    String path, {
    ReqHeaderConfig? config,
    required List<MultipartFile> data,
    Map<String, String>? fields,
  }) async {
    var uri = await getApiUri(path: path);
    var headersConfig = await getReqHeaderConfig({
      HttpHeaders.contentTypeHeader: "multipart/form-data",
      ...?config,
    });

    var request = http.MultipartRequest('POST', uri);

    if (headersConfig != null) {
      request.headers.addAll(headersConfig);
    }

    if (fields != null) {
      request.fields.addAll(fields);
    }

    request.files.addAll(data);

    // ## exxample files
    //     request.files.add(http.MultipartFile.fromBytes(
    //   'file',
    //   file.readAsBytesSync(),
    //   filename: basename(file.path),
    //   contentType: MediaType('image', 'jpeg'),
    // ));

    try {
      return await request.send();
    } catch (e) {
      throw Exception(
        '\n*** client / postfile *** \n URL: $uri *** \nSomething wrong  \n$e',
      );
    }
  }

  readStaticJSON(String path) async {
    try {
      return await rootBundle.loadString(path);
    } catch (e) {
      throw Exception(
        '\n*** client / readStaticJSON *** \n URL: $path \nSomething wrong  \n$e',
      );
    }
  }

  Future<Response?> downloadImageFromNetwork({
    required String url,
    ReqHeaderConfig? config,
  }) async {
    var headersConfig = await getReqHeaderConfig(config);

    try {
      bool isUrlValid = await isUrlOnline(url);

      if (!isUrlValid) {
        return null;
      }

      Uri uri = Uri.parse(url);

      return await http.get(uri, headers: headersConfig);
    } catch (e) {
      throw Exception(
        '\n*** client / downloadImageFromNetwork *** \n URL: $url \nSomething wrong  \n$e',
      );
    }
  }
}

Future<bool> isUrlOnline(String url) async {
  try {
    final response = await HttpClient().getUrl(Uri.parse(url));
    await response.close();
    return true;
  } catch (e) {
    return false;
  }
}

Future<Uri> getApiUri({required String path, ReqQuery? params}) async {
  // Uri urlBase = Uri.parse(dotenv.env['API_DOMAIN'] ?? '');
  Uri urlBase = Uri.parse('http://220.231.94.117:3060/api/v1');
  // Tạo một Map mới để chứa các tham số đã được chuyển đổi
  Map<String, String> stringParams = {};
  if (params != null) {
    params.forEach((key, value) {
      // Chuyển đổi mọi giá trị thành String
      stringParams[key] = value.toString();
    });
  }

  return urlBase.replace(
    path: '${urlBase.path}$path',
    queryParameters: stringParams,
  );
}

Future<Map<String, String>?> getReqHeaderConfig(ReqHeaderConfig? config) async {
  final String? tokenData = await SharedPrefs.getString(TOKEN);

  return {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        tokenData != null && tokenData.isNotEmpty ? 'Bearer $tokenData' : '',
    ...?config,
  };
}
