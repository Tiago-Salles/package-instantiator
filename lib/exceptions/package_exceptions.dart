class AppExceptions {
  static String instanceNotFound<T>() =>
      "ERROR ==> The instance of ${T.toString()} was not found, if you are trying to fetch a Singleton instance you need to register before";
}
