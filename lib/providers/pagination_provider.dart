import 'package:auth_riverpod/base/base_provider.dart';
import 'package:auth_riverpod/data/models/pagination_model.dart';
import 'package:auth_riverpod/data/modules/pagination_module.dart';

class PaginationProvider extends BaseProvider<PaginationModule> {
  PaginationProvider(super.module);

  Future<PaginationModel> getItems(int limit, int offset) =>
      module.getItems(limit, offset);
}
