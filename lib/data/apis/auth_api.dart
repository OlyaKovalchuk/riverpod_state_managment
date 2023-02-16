import 'dart:async';

import 'package:auth_riverpod/data/models/user_model.dart';

class AuthApi {
  Future<UserModel?> getUserSuccessfully() async {
    await Future.delayed(const Duration(seconds: 2));

    return UserModel(
      firstName: 'Alex',
      lastName: 'Smith',
      email: 'alex.smith@gmail.com',
    );
  }

  Future<bool> navigateToNextPage() async {
    return true;
  }

  Future<UserModel?> getUserFailure() async {
    await Future.delayed(const Duration(seconds: 2));
    return throw ('Invalid creds');
  }
}
