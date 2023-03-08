import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/data/apis/auth_api.dart';
import 'package:auth_riverpod/data/apis/pagination_api.dart';
import 'package:auth_riverpod/data/modules/auth_module.dart';
import 'package:auth_riverpod/data/modules/pagination_module.dart';
import 'package:auth_riverpod/pages/app/state_notifier/app_notifier.dart';
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

/// State Notifiers
final appNtProvider = StateNotifierProvider.autoDispose<AppNotifier, BaseState>(
  (ref) {
    final authProvider = ref.watch(authProviderProvider);
    return AppNotifier(authProvider);
  },
  // set name
  name: 'AppStateProvider',
);

final authNtProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, BaseState>(
  (ref) {
    final authProvider = ref.watch(authProviderProvider);
    return AuthNotifier(authProvider);
  },
  // set name
  name: 'AuthStateProvider',
);

final paginationNtProvider =
    StateNotifierProvider.autoDispose<PaginationStateNotifier, BaseState>(
  (ref) {
    final paginationProvider = ref.watch(paginationProviderProvider);
    return PaginationStateNotifier(paginationProvider);
  },
  // set name
  name: 'PaginationStateProvider',
);
