class PaginationBean {
  PaginationBean({
    this.totalCount,
    this.nextOffset,
    this.data,
  });

  int? totalCount;
  int? nextOffset;
  List<int>? data;
}
