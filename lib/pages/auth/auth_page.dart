import 'package:auth_riverpod/base/base_consumer_page.dart';
import 'package:auth_riverpod/base/base_state.dart';
import 'package:auth_riverpod/data/auth_notifier.dart';
import 'package:auth_riverpod/data/models/user_model.dart';
import 'package:auth_riverpod/main.dart';
import 'package:auth_riverpod/pages/auth/auth_state.dart';
import 'package:auth_riverpod/pages/pagination_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AuthPage2State();
}

class _AuthPage2State extends BaseConsumerPage<AuthPage, AuthNotifier> {
  @override
  AutoDisposeStateNotifierProvider<AuthNotifier, BaseState>
      stateNotifierProvider = authNtProvider;

  UserModel? _user;

  @override
  void onRebuild(BaseState state, BuildContext context) {
    super.onRebuild(state, context);
    if (state is GotUserState) {
      _user = state.user;
    }
  }

  @override
  Widget bodyWidget(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Spacer(),
            if (_user != null) ...[
              Text('Full name: ${_user?.firstName} ${_user?.lastName}'),
              Text('Email: ${_user?.email}'),
            ],
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  notifier?.getUserSuccessfully();
                },
                child: const Text('Get user successfully')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  notifier?.getUserFailure();
                },
                child: const Text('Get user failure')),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  notifier?.navigateToNextPage();
                },
                child: const Text('Open Pagination page')),
          ],
        ),
      )),
    );
  }

  @override
  FutureOr<void> onAction(BaseState state, BuildContext context) {
    if (state is OpenNewPage) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PaginationPage(),
          ));
    }

    return super.onAction(state, context);
  }
}
