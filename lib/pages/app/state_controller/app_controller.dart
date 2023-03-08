import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/data/providers/providers.dart';
import 'package:auth_riverpod/pages/app/state_controller/app_state.dart';
import 'package:auth_riverpod/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_controller.g.dart';

@riverpod
class AppController extends BaseStateController {
  late final AuthProvider _provider;

  @override
  BaseState build() {
    _provider = ref.read(authProviderProvider);
    initializeApp();
    return super.build();
  }

  Future<void> initializeApp() => handleState<UserModel?>(
        _provider.getRandomUser,
        onComplete: (UserModel? user) =>
            user != null ? UserIsLoggedState(user) : InitialState(),
        onError: (error, stacktrace) => UserIsNotLoggedState('', ''),
      );
}
