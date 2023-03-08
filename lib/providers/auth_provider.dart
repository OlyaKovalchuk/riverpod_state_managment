import 'package:auth_riverpod/base/base_provider.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/data/modules/auth_module.dart';

class AuthProvider extends BaseProvider<AuthModule> {
  AuthProvider(super.module);

  Future<UserModel?> getRandomUser() => module.getRandomUser();

  Future<UserModel?> getUserSuccessfully() => module.getUserSuccessfully();

  Future<void> navigateToNextPage() => module.navigateToNextPage();

  Future<UserModel?> getUserFailure() => module.getUserFailure();
}
