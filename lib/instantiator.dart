library instantiator;

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

  T fetchInstance<T extends Object>([InstanceCreator<T>? instanceCreator]) {
    final Object? instance;
    if (instanceCreator == null) {
      instance = appInstances.values.whereType<T>();
    } else {
      instance = instanceCreator();
    }

    return instance is T
        ? instance
        : throw Exception(
            "ERROR ==> The instance of ${T.toString()} was not found, if you are trying to fetch a Singleton instance you need to register before");
  }
}
