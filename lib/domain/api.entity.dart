// ignore_for_file: invalid_annotation_target

part of 'main.entity.dart';

typedef ReqHeaderConfig = Map<String, String>;

typedef ReqBody = Map<String, dynamic>;

typedef ReqQuery = Map<String, Object>;

typedef ActionFindMany =
    Future<Response> Function({ReqQuery? query, ReqHeaderConfig? headerConfig});

typedef ActionFindOne =
    Future<Response> Function(
      String id, {
      ReqQuery? query,
      ReqHeaderConfig? headerConfig,
    });

typedef ActionCreatePutDeleteMany =
    Future<Response> Function({ReqBody? body, ReqHeaderConfig? headerConfig});

typedef ActionCreatePutDeleteOne =
    Future<Response> Function(
      String id, {
      ReqBody? body,
      ReqHeaderConfig? headerConfig,
    });

typedef FetchMany<T> = Future<ResFindMany<T>?> Function({ReqQuery? query});

typedef FromJsonT<T> = T Function(Object? json);

@JsonEnum(alwaysCreate: true)
enum ResStatusEnum {
  @JsonValue('success')
  success,

  @JsonValue('SUCCESS')
  // ignore: constant_identifier_names
  SUCCESS,

  @JsonValue('error')
  error,

  @JsonValue('ERROR')
  // ignore: constant_identifier_names
  ERROR,
}

@freezed
abstract class ResBase with _$ResBase {
  const factory ResBase({String? message, ResStatusEnum? status}) = _ResBase;

  factory ResBase.fromJson(Map<String, dynamic> json) =>
      _$ResBaseFromJson(json);
}

@Freezed(genericArgumentFactories: true)
abstract class ResFindManyData<T> with _$ResFindManyData<T> {
  const factory ResFindManyData({
    @JsonKey(name: 'current_page') required int currentPage,
    List<T>? items,
    @JsonKey(name: 'page_size') required int pageSize,
    @JsonKey(name: 'total_items') required int totalItems,
    @JsonKey(name: 'total_pages') required int totalPages,
  }) = _ResFindManyData;

  factory ResFindManyData.fromJson(
    Map<String, dynamic> json,
    FromJsonT<T> fromJsonT,
  ) => _$ResFindManyDataFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
abstract class ResFindMany<T> with _$ResFindMany<T> {
  const factory ResFindMany({
    String? message,
    ResStatusEnum? status,
    required ResFindManyData<T> data,
  }) = _ResFindMany;

  factory ResFindMany.fromJson(
    Map<String, dynamic> json,
    FromJsonT<T> fromJsonT,
  ) {
    return ResFindMany(
      message: json['message'],
      status:
          json['status'] != null
              ? ResStatusEnum.values.byName(json['status'])
              : null,
      data: ResFindManyData<T>.fromJson(json['data'], fromJsonT),
    );
  }
}

@Freezed(genericArgumentFactories: true)
abstract class ResFindOne<T> with _$ResFindOne<T> {
  const factory ResFindOne({String? message, ResStatusEnum? status, T? data}) =
      _ResFindOne;

  factory ResFindOne.fromJson(
    Map<String, dynamic> json,
    FromJsonT<T> fromJsonT,
  ) => _$ResFindOneFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
abstract class ResCUD<T> with _$ResCUD<T> {
  const factory ResCUD({String? message, ResStatusEnum? status, T? data}) =
      _ResCUD;

  factory ResCUD.fromJson(Map<String, dynamic> json, FromJsonT<T> fromJsonT) =>
      _$ResCUDFromJson(json, fromJsonT);
}

@freezed
abstract class BodyDeleteMany with _$BodyDeleteMany {
  const factory BodyDeleteMany({required List<int> ids}) = _BodyDeleteMany;

  factory BodyDeleteMany.fromJson(Map<String, dynamic> json) =>
      _$BodyDeleteManyFromJson(json);
}

var body = BodyDeleteMany(ids: []);

@freezed
abstract class ResFindManyState<T> with _$ResFindManyState<T> {
  const factory ResFindManyState({
    required List<T> data,
    required bool isLoading,
    ReqQuery? query,
    String? error,
  }) = _ResFindManyState;
}

@freezed
abstract class ResFindOneState<T> with _$ResFindOneState<T> {
  const factory ResFindOneState({
    required T data,
    required bool isLoading,
    String? error,
  }) = _ResFindOneState;
}
