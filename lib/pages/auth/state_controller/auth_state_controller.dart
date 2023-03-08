import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/data/providers/providers.dart';
import 'package:auth_riverpod/pages/auth/state_controller/auth_state.dart';
import 'package:auth_riverpod/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_controller.g.dart';

@riverpod
class AuthStateController extends _$AuthStateController with BaseStateCtrMixin {
  late final AuthProvider _provider;

  @override
  BaseState build() {
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
    _provider = ref.read(authProviderProvider);
    return super.build();
  }

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
