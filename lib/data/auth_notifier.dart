import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:auth_riverpod/data/apis/auth_api.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/pages/auth/auth_state.dart';

class AuthNotifier extends BaseStateNotifier {
  AuthNotifier(this.api);

  AuthApi api;

  void navigateToNextPage() => handleState<bool>(
        api.navigateToNextPage,
        onComplete: (bool canPush) => OpenNewPage(),
      );

  void getUserSuccessfully() => handleState<UserModel>(
        api.getUserSuccessfully,
        onComplete: (UserModel? user) =>
            user != null ? GotUserState(user) : InitialState(),
      );

  void getUserFailure() async {
    handleState<UserModel>(
      api.getUserFailure,
      onComplete: (UserModel? user) =>
          user != null ? GotUserState(user) : InitialState(),
    );
  }
}
