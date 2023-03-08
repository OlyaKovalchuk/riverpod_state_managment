import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/data/models/user_model.dart';

class GotUserState extends BaseState {
  final UserModel user;

  GotUserState(this.user);
}

class OpenNewPage extends ActionState {}

class UserIsLoggedState extends BaseState {
  UserIsLoggedState(this.user);

  final UserModel? user;
}
