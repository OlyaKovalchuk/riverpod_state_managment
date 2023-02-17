import 'dart:async';

import 'package:auth_riverpod/data/beans/user_bean.dart';

class AuthApi {
  Future<UserBean?> getUserSuccessfully() async {
    await Future.delayed(const Duration(seconds: 2));

    return UserBean(
      firstName: 'Alex',
      lastName: 'Smith',
      email: 'alex.smith@gmail.com',
    );
  }

  Future<void> navigateToNextPage() async {
    return;
  }

  Future<UserBean?> getUserFailure() async {
    await Future.delayed(const Duration(seconds: 2));
    return throw ('Invalid creds');
  }
}
