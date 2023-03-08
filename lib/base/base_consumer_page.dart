import 'dart:async';

import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'dart:async';

abstract class BaseConsumerPage<T extends ConsumerStatefulWidget,
    Nt extends BaseStateNotifier> extends ConsumerState<T> {
  Nt? notifier;

  AutoDisposeStateNotifierProvider<Nt, BaseState> setStateNtProvider();

  AutoDisposeStateNotifierProvider<Nt, BaseState> get stateNotifierProvider =>
      setStateNtProvider();

  @override
  void initState() {
    super.initState();
    notifier = ref.read(stateNotifierProvider.notifier);
  }

  void onRebuild(BaseState state, BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final stateProvider = ref.watch(stateNotifierProvider);
    ref.listen(
      stateNotifierProvider,
      (prevState, nextState) {
        if (nextState is ErrorState) {
          onError(nextState, context);
        } else if (nextState is ActionState) {
          onAction(nextState, context);
        }
      },
    );
    if (stateProvider is! ErrorState && stateProvider is! ActionState) {
      onRebuild(stateProvider, context);
    }

    return Scaffold(
      body: Stack(
        children: [
          Builder(builder: (context) => bodyWidget(context)),
          if (stateProvider is ProgressState)
            Container(
              color: Colors.grey.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  FutureOr<void> onError(ErrorState state, BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(state.title),
        content: const Text('Oops...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }

  FutureOr<void> onAction(BaseState state, BuildContext context) async {}

  Widget bodyWidget(BuildContext context);
}
