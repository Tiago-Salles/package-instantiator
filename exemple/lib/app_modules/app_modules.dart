import 'package:instanciator/instanciator.dart';

class AppModules {
  static Instanciator fetchInstanciator() {
    Instanciator instanciator = Instanciator.instance();
    instanciator.registerInstance<Repository>(() => Repository());
    instanciator.registerInstance<UseCase>(() => UseCase());
    return instanciator;
  }
}

class Repository {}

class UseCase {}
