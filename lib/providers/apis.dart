import 'package:auth_riverpod/data/apis/auth_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apis.g.dart';

@riverpod
AuthApi authApi(AuthApiRef ref) {
  return AuthApi();
}
