import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:auth_riverpod/data/models/pagination_model.dart';
import 'package:auth_riverpod/data/providers/providers.dart';
import 'package:auth_riverpod/pages/pagination/state_controller/pagination_state.dart';
import 'package:auth_riverpod/providers/pagination_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pagination_state_controller.g.dart';

@riverpod
class PaginationStateController extends _$PaginationStateController
    with BaseStateCtrMixin {
  static const _kLimit = 15;

  late final PaginationProvider _provider;

  @override
  BaseState build() {
    _provider = ref.read(paginationProviderProvider);

    return super.build();
  }

  Future<void> getItems(int? offset) {
    return handleState<PaginationModel>(
      showProgress: false,
      () => _provider.getItems(
        _kLimit,
        offset ?? 0,
      ),
      onComplete: (PaginationModel? items) =>
          GotItemsState(items ?? PaginationModel()),
    );
  }
}
