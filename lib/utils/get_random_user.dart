import 'dart:math';

import 'package:auth_riverpod/data/models/user_model.dart';

Future<UserModel> getRandomUser() async {
  final needReturnUser = Random().nextBool();

  await Future.delayed(const Duration(seconds: 2));

  return needReturnUser
      ? UserModel(
          firstName: 'Alex',
          lastName: 'Baker',
          email: 'alex@gmail.com',
        )
      : throw ('User is not logged in');
}
