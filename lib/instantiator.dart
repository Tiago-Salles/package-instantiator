library instantiator;

import 'package:instantiator/exceptions/package_exceptions.dart';

export '';

typedef InstanceCreator<T extends Object> = T Function();

class Instantiator {
  Instantiator._private();
  static final _instance = Instantiator._private();
  factory Instantiator.instance() {
    return _instance;
  }
  static final appInstances = <Type, Object>{};
  void registerInstance<T extends Object>(InstanceCreator<T> instanceCreator) {
    if (!appInstances.containsKey(T)) {
      appInstances[T] = instanceCreator();
    }
  }

  T fetchSingletonInstance<T extends Object>() {
    final Object? instance;
    instance = appInstances.values.whereType<T>();

    return instance is T
        ? instance
        : throw Exception(AppExceptions.instanceNotFound<T>());
  }

  Object fetchFactoryInstance(InstanceCreator instanceCreator) {
    Object instance = instanceCreator();
    return instance;
  }
}
