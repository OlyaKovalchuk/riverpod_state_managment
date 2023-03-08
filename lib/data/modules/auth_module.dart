import 'package:auth_riverpod/data/apis/auth_api.dart';
import 'package:auth_riverpod/base/base_module.dart';
import 'package:auth_riverpod/data/converters/user_converter.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/data/providers/providers.dart';

class AuthModule extends BaseModule<AuthApi, UserConverter> {
  AuthModule(super.ref);

  @override
  late AuthApi api = ref.read(authApiProvider);

  @override
  UserConverter converter = UserConverter();

  Future<UserModel?> getUserSuccessfully() => api.getUserSuccessfully().then(
        (user) => converter.inToOut(user),
      );

  Future<void> navigateToNextPage() => api.navigateToNextPage();

  Future<UserModel?> getUserFailure() => api.getUserFailure().then(
        (user) => converter.inToOut(user),
      );
}
