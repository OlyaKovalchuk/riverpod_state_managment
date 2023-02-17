import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/pages/auth/state_notifier/auth_notifier.dart';
import 'package:auth_riverpod/pages/auth/auth_page.dart';
import 'package:auth_riverpod/utils/logger_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNtProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, BaseState>(
  (ref) {
    return AuthNotifier(ref);
  },
  // set name
  name: 'AuthStateProvider',
);

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    // Adding our Logger to the list of observers
    ProviderScope(
      observers: [Logger()],
      child: const MaterialApp(home: AuthPage()),
    ),
  );
}
