// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:dynamicform/utils/helper.dart';

import '../../domain/main.entity.dart';

// new version Hook api
class UseApiService<T> {
  final Function action;
  final BuildContext? context;
  final bool? showSnackBar;
  final String? msgSuccess;
  final String? msgError;

  UseApiService({
    required this.action,
    this.context,
    this.showSnackBar = true,
    this.msgSuccess,
    this.msgError,
  });

  Future<ResFindMany<T>?> getList({
    ReqQuery? query,
    ReqHeaderConfig? headerConfig,
    required FromJsonT<T> fromJsonT,
  }) async {
    try {
      final ActionFindMany actionDeined = action as ActionFindMany;
      Response res = await actionDeined(
        query: query,
        headerConfig: headerConfig,
      );
      final mapResponsive = jsonDecode(res.body);
      ResFindMany<T> decodeBody = ResFindMany.fromJson(mapResponsive, (json) {
        return fromJsonT(json);
      });

      if (decodeBody.status == null) {
        decodeBody = decodeBody.copyWith(
          status:
              res.statusCode >= 200 && res.statusCode < 300
                  ? ResStatusEnum.SUCCESS
                  : ResStatusEnum.ERROR,
        );
      }

      return decodeBody;
    } catch (e) {
      print('getList ====== \n$e\n\n');
      return null;
    }
  }

  Future<ResFindOne<T>?> getByID({
    required String id,
    required FromJsonT<T> fromJsonT,
    ReqQuery? query,
    ReqHeaderConfig? headerConfig,
  }) async {
    try {
      final ActionFindOne actionDeined = action as ActionFindOne;
      Response res = await actionDeined(
        id,
        query: {...?query},
        headerConfig: headerConfig,
      );

      final mapResponsive = jsonDecode(res.body);
      ResFindOne<T> decodeBody = ResFindOne.fromJson(mapResponsive, fromJsonT);

      if (decodeBody.status == null) {
        decodeBody = decodeBody.copyWith(
          status:
              res.statusCode >= 200 && res.statusCode < 300
                  ? ResStatusEnum.SUCCESS
                  : ResStatusEnum.ERROR,
        );
      }

      return decodeBody;
    } catch (e) {
      print('UseGetById ====== \n$e\n\n');
      return null;
    }
  }

  Future<ResCUD<T>?> cud({
    ReqBody? body,
    ReqHeaderConfig? headerConfig,
    required FromJsonT<T> fromJsonT,
  }) async {
    try {
      final actionDeined = action as ActionCreatePutDeleteMany;
      Response res = await actionDeined(body: body, headerConfig: headerConfig);

      final mapResponsive = jsonDecode(res.body);
      var decodeBody = ResCUD.fromJson(mapResponsive, fromJsonT);

      if (decodeBody.status == null) {
        decodeBody = decodeBody.copyWith(
          status:
              res.statusCode >= 200 && res.statusCode < 300
                  ? ResStatusEnum.SUCCESS
                  : ResStatusEnum.ERROR,
        );
      }

      // succuess
      if (isCallAPIStatusSuccess(decodeBody.status)) {
        if (context != null &&
            context!.mounted &&
            decodeBody.message != null &&
            showSnackBar == true) {
          return decodeBody;
        }
      }

      // error
      if (context != null &&
          context!.mounted &&
          decodeBody.message != null &&
          showSnackBar == true) {
      }

      return decodeBody;
    } catch (e) {
      print('UsePost ====== \n$e\n\n');
      return null;
    }
  }

  Future<ResCUD<T>?> cudById({
    required String id,
    ReqBody? body,
    ReqHeaderConfig? headerConfig,
    required FromJsonT<T> fromJsonT,
  }) async {
    try {
      final actionDeined = action as ActionCreatePutDeleteOne;
      Response res = await actionDeined(
        id,
        body: body,
        headerConfig: headerConfig,
      );

      final mapResponsive = jsonDecode(res.body);
      var decodeBody = ResCUD.fromJson(mapResponsive, fromJsonT);

      if (decodeBody.status == null) {
        decodeBody = decodeBody.copyWith(
          status:
              res.statusCode >= 200 && res.statusCode < 300
                  ? ResStatusEnum.SUCCESS
                  : ResStatusEnum.ERROR,
        );
      }

      // succuess
      if (isCallAPIStatusSuccess(decodeBody.status)) {
        if (context != null &&
            context!.mounted &&
            decodeBody.message != null &&
            showSnackBar == true) {

        }

        return decodeBody;
      }

      // error
      if (context != null &&
          context!.mounted &&
          decodeBody.message != null &&
          showSnackBar == true) {

      }

      return null;
    } catch (e) {
      print('UsePost ====== \n$e\n\n');
      return null;
    }
  }

  // postFiles({
  //   required List<MultipartFile> body,
  //   Map<String, String>? fields,
  // }) async {
  //   try {
  //     dynamic res = await action(body: body, fields: fields);

  //     var responseData = await res.stream.toBytes();

  //     var resMap = String.fromCharCodes(responseData);

  //     var json = jsonDecode(resMap) as Map<String, dynamic>;

  //     var decodeBody = ResponseAzpc.fromJson(json);

  //     // succuess
  //     if (decodeBody.statusCode == 200) {
  //       if (context.mounted &&
  //           decodeBody.message?.content != null &&
  //           decodeBody.message!.content!.isNotEmpty &&
  //           showSnackBar == true) {
  //         snackBarSuccess(
  //           context: context,
  //           text: decodeBody.message?.content ?? '',
  //         );
  //       }

  //       return decodeBody;
  //     }

  //     // error
  //     if (context.mounted &&
  //         decodeBody.message?.content != null &&
  //         decodeBody.message!.content!.isNotEmpty) {
  //       snackBarError(
  //         context: context,
  //         text: decodeBody.message?.content ?? '',
  //       );
  //     }

  //     return null;
  //   } catch (e) {
  //     print('UsePostFiles ====== \n$e\n\n');
  //     return null;
  //   }
  // }

  // readStaticJson() async {
  //   try {
  //     final dynamic res = await action();

  //     return jsonDecode(res);
  //   } catch (e) {
  //     print('readStaticJson ====== \n$e\n\n');
  //     return null;
  //   }
  // }

  // readStaticJsonByID({required String id}) async {
  //   try {
  //     final dynamic res = await action(id: id);

  //     return jsonDecode(res);
  //   } catch (e) {
  //     print('readStaticJsonByID ====== \n$e\n\n');
  //     return null;
  //   }
  // }

  // downloadImage({required String url}) async {
  //   final tranport = RestTransport();
  //   try {
  //     final perssions = await Permission.storage.request();

  //     if (!perssions.isGranted) {
  //       if (context.mounted && showSnackBar == true) {
  //         snackBarError(
  //           context: context,
  //           text: 'Vui lòng cấp phép truy cập thư viện để tải ảnh!',
  //         );
  //       }
  //     }

  //     Response? res = await tranport.downloadImageFromNetwork(url: url);

  //     if (res == null) {
  //       if (context.mounted && showSnackBar == true) {
  //         snackBarError(context: context, text: 'Tải ảnh thất bại!');
  //       }
  //     }

  //     // Cover to byes
  //     final bytes = res!.bodyBytes;

  //     // 5. Save the image to the device's gallery
  //     await ImageGallerySaverPlus.saveImage(bytes);

  //     if (context.mounted && showSnackBar == true) {
  //       snackBarSuccess(context: context, text: 'Tải ảnh thành công!');
  //     }
  //   } catch (e) {
  //     print('downloadImage ====== \nUrl: $url\n$e\n\n');
  //   }
  // }
}
