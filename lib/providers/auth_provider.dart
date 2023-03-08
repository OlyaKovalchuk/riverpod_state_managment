import 'package:auth_riverpod/base/base_provider.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/data/modules/auth_module.dart';
import 'package:auth_riverpod/data/providers/providers.dart';

class AuthProvider extends BaseProvider<AuthModule> {
  AuthProvider(super.ref);

  @override
  late AuthModule module = ref.read(authModuleProvider);

  Future<UserModel?> getUserSuccessfully() => module.getUserSuccessfully();

  Future<void> navigateToNextPage() => module.navigateToNextPage();

  Future<UserModel?> getUserFailure() => module.getUserFailure();
}
