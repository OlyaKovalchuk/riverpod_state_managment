import 'package:auth_riverpod/base/base_module.dart';

abstract class BaseProvider<T extends BaseModule> {
  BaseProvider(this.module);

  final T module;
}
