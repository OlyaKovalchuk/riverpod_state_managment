import 'dart:async';

import 'package:auth_riverpod/base/base_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin BaseStateCtrMixin on AutoDisposeNotifier<BaseState> {
  @override
  BaseState build() {
    return InitialState();
  }

  /// doAsync in flutter_starter
  Future<void> handleState<T>(
    Future Function() function, {
    FutureOr<BaseState?> Function(T? response)? onComplete,
    OnErrorCallback? onError,
    BaseState? progressState,
    bool showProgress = true,
  }) async {
    try {
      if (showProgress) {
        state = progressState ?? ProgressState();
      }
      final response = await function();
      state = (await onComplete?.call(response)) ?? InitialState();
    } catch (error, stack) {
      if (onError != null) {
        final res = await onError(error, stack);
        if (res is BaseState) {
          state = res;
        } else {
          state = InitialState();
        }
      } else {
        state = errorHandler(error, stack);
      }
    }
  }

  ErrorState errorHandler(Object error, StackTrace stackTrace) {
    return ErrorState(
      error.toString(),
      stackTrace.toString(),
    );
  }
}

typedef OnErrorCallback = FutureOr<dynamic> Function(
  Object error,
  StackTrace stack,
);
