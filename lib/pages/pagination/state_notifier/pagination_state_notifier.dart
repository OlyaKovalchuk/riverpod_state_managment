import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:auth_riverpod/data/models/pagination_model.dart';
import 'package:auth_riverpod/pages/pagination/state_notifier/pagination_state.dart';
import 'package:auth_riverpod/providers/pagination_provider.dart';

class PaginationStateNotifier extends BaseStateNotifier<PaginationProvider> {
  PaginationStateNotifier(super.provider);

  static const _kLimit = 15;

  Future<void> getItems(int? offset) {
    return handleState<PaginationModel>(
      showProgress: false,
      () => provider.getItems(
        _kLimit,
        offset ?? 0,
      ),
      onComplete: (PaginationModel? items) =>
          GotItemsState(items ?? PaginationModel()),
    );
  }
}
