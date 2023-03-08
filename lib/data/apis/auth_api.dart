import 'dart:async';
import 'dart:math';

import 'package:auth_riverpod/data/beans/user_bean.dart';

class AuthApi {
  Future<UserBean> getRandomUser() async {
    final needReturnUser = Random().nextBool();

    await Future.delayed(const Duration(seconds: 2));

    return needReturnUser
        ? UserBean(
            firstName: 'Alex',
            lastName: 'Baker',
            email: 'alex@gmail.com',
          )
        : throw ('User is not logged in');
  }

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
