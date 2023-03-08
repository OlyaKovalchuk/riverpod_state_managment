import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/data/models/pagination_model.dart';

class GotItemsState extends ActionState {
  GotItemsState(this.items);

  final PaginationModel items;
}
