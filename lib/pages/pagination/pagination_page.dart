import 'package:auth_riverpod/base/base_consumer_page.dart';
import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/data/providers/providers.dart';
import 'package:auth_riverpod/pages/pagination/state_notifier/pagination_state.dart';
import 'package:auth_riverpod/pages/pagination/state_notifier/pagination_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationPage extends ConsumerStatefulWidget {
  const PaginationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaginationPageState();
}

class _PaginationPageState
    extends BaseConsumerPage<PaginationPage, PaginationStateNotifier> {
  final _pagingController = PagingController<int, int>(firstPageKey: 0);

  @override
  AutoDisposeStateNotifierProvider<PaginationStateNotifier, BaseState>
      setStateNtProvider() => paginationNtProvider;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_onNextRequest);
  }

  @override
  void dispose() {
    _pagingController
      ..removeListener(_onNextRequest)
      ..dispose();
    super.dispose();
  }

  @override
  Widget bodyWidget(BuildContext context) {
    return SafeArea(
      child: PagedListView<int, int>.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<int>(
          itemBuilder: (context, item, index) => ListTile(
            title: Text('Item #$item'),
          ),
          noMoreItemsIndicatorBuilder: (context) => const Center(
            child: Text('No items found'),
          ),
        ),
        separatorBuilder: (_, __) => const Divider(
          color: Colors.black26,
        ),
      ),
    );
  }

  @override
  FutureOr<void> onAction(BaseState state, BuildContext context) {
    if (state is GotItemsState) {
      _pagingController.appendPage(
        state.items.data ?? [],
        state.items.nextOffset,
      );
    }

    return super.onAction(state, context);
  }

  Future<void> _onNextRequest([int offset = 0]) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier?.getItems(offset);
    });
  }
}
