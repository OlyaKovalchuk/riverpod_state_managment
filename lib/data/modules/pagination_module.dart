import 'package:auth_riverpod/base/base_module.dart';
import 'package:auth_riverpod/data/apis/pagination_api.dart';
import 'package:auth_riverpod/data/converters/pagination_converter.dart';
import 'package:auth_riverpod/data/models/pagination_model.dart';
import 'package:auth_riverpod/data/providers/providers.dart';

class PaginationModule extends BaseModule<PaginationApi, PaginationConverter> {
  PaginationModule(super.ref);

  @override
  late PaginationApi api = ref.read(paginationApiProvider);

  @override
  PaginationConverter converter = PaginationConverter();

  Future<PaginationModel> getItems(int limit, int offset) =>
      api.getItems(limit, offset).then((value) => converter.inToOut(value));
}
