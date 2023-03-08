import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/pages/auth/state_notifier/auth_state.dart';
import 'package:auth_riverpod/providers/auth_provider.dart';

class AuthNotifier extends BaseStateNotifier<AuthProvider> {
  AuthNotifier(super.provider);

  /// ref.read replaces us with injector<Provider>().
  /// This also makes testing easier for us.
  ///
  /// For example:
  /// With Riverpod
  /// authApiProvider.overrideWithValue(MockAuthProvider())
  ///
  /// With GetIt.
  /// GetIt.I.registerSingleton<AuthApi>(MockAuthProvider())
  ///
  /// Also, with this method, we don't need to register a singleton as with GetIT

  void navigateToNextPage() => handleState<void>(
        provider.navigateToNextPage,
        onComplete: (_) => OpenNewPage(),
      );

  void getUserSuccessfully() => handleState<UserModel>(
        provider.getUserSuccessfully,
        onComplete: (UserModel? user) =>
            user != null ? GotUserState(user) : InitialState(),
      );

  void getUserFailure() async {
    handleState<UserModel>(
      provider.getUserFailure,
      onComplete: (UserModel? user) =>
          user != null ? GotUserState(user) : InitialState(),
    );
  }
}
