import 'package:auth_riverpod/base/base_provider.dart';
import 'package:auth_riverpod/data/models/pagination_model.dart';
import 'package:auth_riverpod/data/modules/pagination_module.dart';
import 'package:auth_riverpod/data/providers/providers.dart';

class PaginationProvider extends BaseProvider<PaginationModule> {
  PaginationProvider(super.ref);

  @override
  late PaginationModule module = ref.read(paginationModuleProvider);

  Future<PaginationModel> getItems(int limit, int offset) =>
      module.getItems(limit, offset);
}
