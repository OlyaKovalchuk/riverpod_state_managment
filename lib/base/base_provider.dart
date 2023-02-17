import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseProvider<Module> implements IProvider<Module> {
  BaseProvider(this.ref);

  final ProviderRef<BaseProvider> ref;
}

abstract class IProvider<Module> {
  late final Module module;
}
