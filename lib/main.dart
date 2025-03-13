import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/dependency_injection.dart';
import 'core/theming/app_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([setupGetIt(), AppSizer.ensureScreenSize()]);

  runApp(const App());
}
