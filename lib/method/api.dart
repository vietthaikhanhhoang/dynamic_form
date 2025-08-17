part of 'indext.dart';

Future<ResFindManyData<T>?> useFindMany<T>({
  ReqQuery? query,
  bool? isMerge,
  bool? isAutoFetch,
  required List<T> initItems,
  required FetchMany<T> getList,
}) async {
  try {
    var res = await getList(query: query);

    if (res == null || !isCallAPIStatusSuccess(res.status)) {
      return null;
    }

    if (isAutoFetch == true) {
      ResFindManyData<T> resultAutoFetch = res.data;

      for (
        int page = resultAutoFetch.currentPage + 1;
        page <= resultAutoFetch.totalPages;
        page++
      ) {
        final resLoop = await getList(
          query: {...?query, SearchParamsKey.page: page},
        );

        if (resLoop != null && isCallAPIStatusSuccess(resLoop.status)) {
          resultAutoFetch = resLoop.data.copyWith(
            items: [...?resultAutoFetch.items, ...?resLoop.data.items],
          );
        }
      }

      return resultAutoFetch;
    }

    if (isMerge == true) {
      return res.data.copyWith(items: [...initItems, ...?res.data.items]);
    }

    return res.data;
  } catch (e) {
    return null;
  }
}
