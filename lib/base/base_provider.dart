import 'package:auth_riverpod/base/base_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseProvider<T extends BaseModule> {
  BaseProvider(this.module);

  final T module;
}

abstract class IProvider<Module> {
  late final Module module;
}
