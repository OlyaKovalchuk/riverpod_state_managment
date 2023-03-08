import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/pages/app/state_notifier/app_state.dart';
import 'package:auth_riverpod/utils/get_random_user.dart';

class AppNotifier extends BaseStateNotifier {
  AppNotifier(super.ref) {
    // it's the same as if we were calling a method in the initState in the widget
    initializeApp();
  }

  void initializeApp() => handleState<UserModel?>(
        getRandomUser,
        onComplete: (UserModel? user) =>
            user != null ? UserIsLoggedState(user) : InitialState(),
        onError: (error, stacktrace) => UserIsNotLoggedState('', ''),
      );
}
