import 'package:instantiator/instantiator.dart';

class AppModules {
  static Instantiator fetchInstantiator() {
    Instantiator instantiator = Instantiator.instance();
    instantiator.registerInstance<Repository>(() => Repository());
    instantiator.registerInstance<UseCase>(() => UseCase());
    return instantiator;
  }
}

class Repository {}

class UseCase {}
