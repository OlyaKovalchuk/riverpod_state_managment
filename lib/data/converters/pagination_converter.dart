import 'package:auth_riverpod/data/beans/pagination_bean.dart';
import 'package:auth_riverpod/data/models/pagination_model.dart';

class PaginationConverter {
  PaginationModel inToOut(PaginationBean inObject) {
    return PaginationModel(
      totalCount: inObject.totalCount,
      nextOffset: inObject.nextOffset,
      data: inObject.data,
    );
  }

  PaginationBean outToIn(PaginationModel outObject) {
    return PaginationBean(
      totalCount: outObject.totalCount,
      nextOffset: outObject.nextOffset,
      data: outObject.data,
    );
  }
}
