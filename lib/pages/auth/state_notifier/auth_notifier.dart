import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/data/providers/providers.dart';
import 'package:auth_riverpod/pages/auth/state_notifier/auth_state.dart';

class AuthNotifier extends BaseStateNotifier {
  AuthNotifier(super.ref);

  /// ref.read replaces us with injector<Api>().
  /// This also makes testing easier for us.
  ///
  /// For example:
  /// With Riverpod
  /// authApiProvider.overrideWithValue(MockAuthApi())
  ///
  /// With GetIt.
  /// GetIt.I.registerSingleton<AuthApi>(MockAuthApi())
  ///
  /// Also, with this method, we don't need to register a singleton as with GetIT
  late final _provider = ref.read(authProviderProvider);

  void navigateToNextPage() => handleState<void>(
        _provider.navigateToNextPage,
        onComplete: (_) => OpenNewPage(),
      );

  void getUserSuccessfully() => handleState<UserModel>(
        _provider.getUserSuccessfully,
        onComplete: (UserModel? user) =>
            user != null ? GotUserState(user) : InitialState(),
      );

  void getUserFailure() async {
    handleState<UserModel>(
      _provider.getUserFailure,
      onComplete: (UserModel? user) =>
          user != null ? GotUserState(user) : InitialState(),
    );
  }
}
