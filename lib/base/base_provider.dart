import 'package:auth_riverpod/base/base_module.dart';

abstract class BaseProvider<Module extends BaseModule> {
  BaseProvider(this.module);

  final Module module;
}
