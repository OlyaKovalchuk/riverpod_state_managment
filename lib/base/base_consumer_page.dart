import 'dart:async';

import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/base/base_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'dart:async';

abstract class BaseConsumerPage<T extends ConsumerStatefulWidget,
        Nt extends BaseStateNotifier> extends ConsumerState<T>
    implements IStateNotifierProvider<Nt> {
  Nt? notifier;

  void onRebuild(BaseState state, BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final stateProvider = ref.watch(stateNotifierProvider);

    notifier = ref.read(stateNotifierProvider.notifier);

    ref.listen(stateNotifierProvider, (prevState, nextState) {
      if (nextState is ErrorState) {
        onError(nextState, context);
      } else if (nextState is ActionState) {
        onAction(nextState, context);
      } else {
        onRebuild(nextState, context);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          bodyWidget(context),
          if (stateProvider is ProgressState)
            Container(
              color: Colors.grey.withOpacity(0.3),
              child: InkWell(
                // ignore: no-empty-block
                onTap: () {},
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        // Todo starter: change or remove logo.
                        FlutterLogo(),
                        SizedBox(height: 20),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
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
        content: Text(state.msg),
      ),
    );
  }

  FutureOr<void> onAction(BaseState state, BuildContext context) async {}

  Widget bodyWidget(BuildContext context);
}

abstract class IStateNotifierProvider<Nt extends BaseStateNotifier> {
  late final AutoDisposeStateNotifierProvider<Nt, BaseState>
      stateNotifierProvider;
}
