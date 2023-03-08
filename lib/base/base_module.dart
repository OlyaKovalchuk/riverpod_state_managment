import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class BaseModule<Api, Converter> implements IModule<Api, Converter> {
  BaseModule(this.ref);

  final ProviderRef<BaseModule> ref;
}

abstract class IModule<Api, Converter> {
  late final Converter converter;
  late final Api api;
}
