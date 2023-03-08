import 'package:auth_riverpod/base/base_module.dart';
import 'package:auth_riverpod/data/apis/auth_api.dart';
import 'package:auth_riverpod/data/converters/user_converter.dart';
import 'package:auth_riverpod/data/models/user_model.dart';

class AuthModule extends BaseModule<AuthApi, UserConverter> {
  AuthModule(super.api);

  @override
  UserConverter converter = UserConverter();

  Future<UserModel?> getRandomUser() => api.getRandomUser().then(
        (user) => converter.inToOut(user),
      );

  Future<UserModel?> getUserSuccessfully() => api.getUserSuccessfully().then(
        (user) => converter.inToOut(user),
      );

  Future<void> navigateToNextPage() => api.navigateToNextPage();

  Future<UserModel?> getUserFailure() => api.getUserFailure().then(
        (user) => converter.inToOut(user),
      );
}
