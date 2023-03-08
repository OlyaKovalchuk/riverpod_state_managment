import 'package:auth_riverpod/data/beans/pagination_bean.dart';

class PaginationApi {
  Future<PaginationBean> getItems(int limit, int offset) async {
    await Future.delayed(const Duration(seconds: 2));

    return Future.value(
      PaginationBean(
        nextOffset: offset + limit,
        totalCount: limit * 10,
        data: List.generate(
          limit,
          (index) => offset + index,
        ),
      ),
    );
  }
}
