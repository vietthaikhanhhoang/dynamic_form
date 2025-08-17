import 'package:flutter/material.dart';
import 'package:dynamicform/application/utils/use_api.dart';
import 'package:dynamicform/domain/main.entity.dart';
import 'package:dynamicform/method/indext.dart';

// Controller for Create, Update, Delete operations
class UseCUD<T> extends ChangeNotifier {
  UseCUD({
    this.context,
    required this.action,
    required this.fromJsonT,
    this.headerConfig,
    required this.showSnackBar,
    this.msgSuccess,
    this.msgError,
  });

  final BuildContext? context;
  final ActionCreatePutDeleteMany action;
  final FromJsonT<T> fromJsonT;
  final Map<String, String>? headerConfig;
  final bool showSnackBar;
  final String? msgSuccess;
  final String? msgError;

  ResCUD<T>? _data;
  ResCUD<T>? get data => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set data(ResCUD<T>? data) {
    this._data = data;
    notifyListeners();
  }

  void post({ReqBody? body}) async {
    var hook = UseApiService<T>(
      action: action,
      context: context,
      msgError: msgError,
      msgSuccess: msgSuccess,
      showSnackBar: showSnackBar,
    );

    _isLoading = true;
    notifyListeners();

    try {
      var res = await hook.cud(
        body: body,
        fromJsonT: fromJsonT,
        headerConfig: headerConfig,
      );

      _data = res;
    } catch (e) {
      _data = null;
      print('Error post data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class UseCUDByID<T> extends ChangeNotifier {
  UseCUDByID({
    this.context,
    required this.action,
    required this.fromJsonT,
    required this.headerConfig,
    required this.showSnackBar,
    this.msgSuccess,
    this.msgError,
  });

  final BuildContext? context;
  final ActionCreatePutDeleteOne action;
  final FromJsonT<T> fromJsonT;
  final Map<String, String>? headerConfig;
  final bool showSnackBar;
  final String? msgSuccess;
  final String? msgError;

  ResCUD<T>? _data;
  ResCUD<T>? get data => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void post(String id, {ReqBody? body}) async {
    var hook = UseApiService<T>(
      action: action,
      context: context,
      msgError: msgError,
      msgSuccess: msgSuccess,
      showSnackBar: showSnackBar,
    );

    _isLoading = true;

    try {
      var res = await hook.cudById(
        id: id,
        body: body,
        fromJsonT: fromJsonT,
        headerConfig: headerConfig,
      );
      _data = res;
    } catch (e) {
      print('Error post data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class UseFindMany<T> extends ChangeNotifier {
  UseFindMany({
    required this.action,
    required this.fromJsonT,
    this.headerConfig,
    List<T>? data,
    this.query,
    bool isLoading = false,
  }) {
    _data = data;
    _isLoading = isLoading;
  }

  final ActionFindMany action;
  final FromJsonT<T> fromJsonT;
  final Map<String, String>? headerConfig;

  ReqQuery? query;

  List<T>? _data;
  List<T>? get data => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void get({
    ReqQuery? query,
    final bool? isMerge,
    final bool? isAutoFetch,
  }) async {
    var hook = UseApiService<T>(action: action);

    _isLoading = true;
    query = this.query;
    notifyListeners();

    try {
      final findManyData = await useFindMany<T>(
        query: query,
        isMerge: isMerge,
        isAutoFetch: isAutoFetch,
        initItems: _data ?? [],
        getList: ({query}) async {
          return await hook.getList(
            query: query,
            fromJsonT: fromJsonT,
            headerConfig: headerConfig,
          );
        },
      );

      _data = findManyData?.items;
      _isLoading = false;
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class UseFindOne<T> extends ChangeNotifier {
  UseFindOne({
    required this.action,
    required this.fromJsonT,
    this.headerConfig,
    this.query,
    T? data,
    bool isLoading = false,
  }) {
    _data = data;
    _isLoading = isLoading;
  }

  final ActionFindOne action;
  final FromJsonT<T> fromJsonT;
  final Map<String, String>? headerConfig;

  ReqQuery? query;

  T? _data;
  T? get data => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<T?> get(String id, {ReqQuery? query}) async {
    var hook = UseApiService<T>(action: action);

    _isLoading = true;
    query = this.query;
    notifyListeners();

    try {
      final res = await hook.getByID(
        id: id,
        query: query,
        fromJsonT: fromJsonT,
        headerConfig: headerConfig,
      );
      _data = res?.data;
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }

    return Future.value(_data);
  }
}
