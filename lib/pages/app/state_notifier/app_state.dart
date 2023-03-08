import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/data/models/user_model.dart';

class UserIsLoggedState extends BaseState {
  UserIsLoggedState(this.user);

  final UserModel user;
}

class UserIsNotLoggedState extends ErrorState {
  UserIsNotLoggedState(super.title, super.msg);
}
