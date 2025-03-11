import 'package:flutter/material.dart';

import 'core/theming/app_sizer.dart';
import 'core/theming/app_theme.dart';
import 'features/search/ui/search_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, _) {
        AppSizer.initialize(context);
        return const _MaterialAppWidget();
      },
    );
  }
}

class _MaterialAppWidget extends StatelessWidget {
  const _MaterialAppWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Search',
      theme: AppTheme.dark,
      home: const SearchScreen(),
    );
  }
}
