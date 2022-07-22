import 'package:example/app_modules/app_modules.dart';
import 'package:flutter/material.dart';
import 'package:instantiator/instantiator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Instantiator instantiator = AppModules.fetchInstantiator();

  @override
  void initState() {
    instantiator.fetchInstance<Repository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
