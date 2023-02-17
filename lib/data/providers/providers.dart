import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/data/apis/auth_api.dart';
import 'package:auth_riverpod/data/apis/pagination_api.dart';
import 'package:auth_riverpod/data/modules/auth_module.dart';
import 'package:auth_riverpod/data/modules/pagination_module.dart';
import 'package:auth_riverpod/pages/auth/state_notifier/auth_notifier.dart';
import 'package:auth_riverpod/pages/pagination/state_notifier/pagination_state_notifier.dart';
import 'package:auth_riverpod/providers/auth_provider.dart';
import 'package:auth_riverpod/providers/pagination_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Providers
@riverpod
AuthProvider authProvider(AuthProviderRef ref) {
  return AuthProvider(ref);
}

@riverpod
PaginationProvider paginationProvider(PaginationProviderRef ref) {
  return PaginationProvider(ref);
}

/// Modules
@riverpod
AuthModule authModule(AuthModuleRef ref) {
  return AuthModule(ref);
}

@riverpod
PaginationModule paginationModule(PaginationModuleRef ref) {
  return PaginationModule(ref);
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

/// State Notifiers
final authNtProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, BaseState>(
  (ref) {
    return AuthNotifier(ref);
  },
  // set name
  name: 'AuthStateProvider',
);

final paginationNtProvider =
    StateNotifierProvider.autoDispose<PaginationStateNotifier, BaseState>(
  (ref) {
    return PaginationStateNotifier(ref);
  },
  // set name
  name: 'PaginationStateProvider',
);
