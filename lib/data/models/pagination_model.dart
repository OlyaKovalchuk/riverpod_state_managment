class PaginationModel {
  PaginationModel({
    this.totalCount,
    this.nextOffset,
    this.data,
  });

  int? totalCount;
  int? nextOffset;
  List<int>? data;
}
