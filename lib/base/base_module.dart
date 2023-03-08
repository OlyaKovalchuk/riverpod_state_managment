abstract class BaseModule<Api, Converter> implements IConverter<Converter> {
  BaseModule(this.api);

  final Api api;
}

abstract class IConverter<Converter> {
  late final Converter converter;
}
