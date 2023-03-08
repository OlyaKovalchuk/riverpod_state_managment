import 'package:auth_riverpod/data/apis/auth_api.dart';
import 'package:auth_riverpod/data/apis/pagination_api.dart';
import 'package:auth_riverpod/data/modules/auth_module.dart';
import 'package:auth_riverpod/data/modules/pagination_module.dart';
import 'package:auth_riverpod/providers/auth_provider.dart';
import 'package:auth_riverpod/providers/pagination_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Providers
@riverpod
AuthProvider authProvider(AuthProviderRef ref) {
  final authModule = ref.watch(authModuleProvider);
  return AuthProvider(authModule);
}

@riverpod
PaginationProvider paginationProvider(PaginationProviderRef ref) {
  final paginationModule = ref.watch(paginationModuleProvider);
  return PaginationProvider(paginationModule);
}

/// Modules
@riverpod
AuthModule authModule(AuthModuleRef ref) {
  final authApi = ref.watch(authApiProvider);
  return AuthModule(authApi);
}

@riverpod
PaginationModule paginationModule(PaginationModuleRef ref) {
  final paginationApi = ref.watch(paginationApiProvider);
  return PaginationModule(paginationApi);
}

/// Apis
@riverpod
AuthApi authApi(_) {
  return AuthApi();
}

@riverpod
PaginationApi paginationApi(_) {
  return PaginationApi();
}
