import 'package:auth_riverpod/data/apis/auth_api.dart';
import 'package:auth_riverpod/data/modules/auth_module.dart';
import 'package:auth_riverpod/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Providers
@riverpod
AuthProvider authProvider(AuthProviderRef ref) {
  return AuthProvider(ref);
}

/// Modules
@riverpod
AuthModule authModule(AuthModuleRef ref) {
  return AuthModule(ref);
}

/// Apis
@riverpod
AuthApi authApi(_) {
  return AuthApi();
}
