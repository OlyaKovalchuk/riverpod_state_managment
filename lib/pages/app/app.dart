import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/pages/app/state_controller/app_controller.dart';
import 'package:auth_riverpod/pages/app/state_controller/app_state.dart';
import 'package:auth_riverpod/pages/auth/auth_page.dart';
import 'package:auth_riverpod/widgets/error_page.dart';
import 'package:auth_riverpod/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _navKey = GlobalKey<NavigatorState>();

NavigatorState? get nav => _navKey.currentState;

class App extends ConsumerStatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  void onStateListener(BaseState? prev, BaseState state) {
    if (state is ErrorState) {
      _onError(state);
    } else if (state is UserIsLoggedState) {
      final navContext = nav?.context;
      if (navContext != null) {
        Navigator.pushAndRemoveUntil(
          navContext,
          MaterialPageRoute(
            builder: (_) => AuthPage(user: state.user),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      appControllerProvider,
      onStateListener,
    );

    return MaterialApp(
      navigatorKey: _navKey,
      home: const SplashScreen(),
    );
  }

  void _onError(ErrorState state) {
    if (state is UserIsNotLoggedState) {
      final navContext = nav?.context;
      if (navContext != null) {
        Navigator.pushAndRemoveUntil(
          navContext,
          MaterialPageRoute(builder: (_) => const ErrorPage()),
          (route) => false,
        );
      }
    }
  }
}
