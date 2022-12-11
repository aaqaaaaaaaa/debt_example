import 'dart:async';

import 'package:debt_example/di/dependency_injection.dart' as di;
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runZonedGuarded(() {
    runApp(const AppProvider());
  }, (error, stacktrace) {
    // log('runZonedGuarded Errors: $error');
    debugPrint("add new branch");
  });
}
