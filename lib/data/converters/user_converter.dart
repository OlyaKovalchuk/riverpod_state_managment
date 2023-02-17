import 'package:auth_riverpod/data/beans/user_bean.dart';
import 'package:auth_riverpod/data/models/user_model.dart';

class UserConverter {
  UserModel? inToOut(UserBean? inObject) {
    return inObject != null
        ? UserModel(
            firstName: inObject.firstName,
            lastName: inObject.lastName,
            email: inObject.email,
          )
        : null;
  }

  UserBean? outToIn(UserModel? outObject) {
    return outObject != null
        ? UserBean(
            firstName: outObject.firstName,
            lastName: outObject.lastName,
            email: outObject.email,
          )
        : null;
  }
}
