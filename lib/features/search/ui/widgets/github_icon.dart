import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';

class GithubIcon extends StatelessWidget {
  const GithubIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxWidth: 240),
      child: Image.asset(AppAssets.logo, fit: BoxFit.contain),
    );
  }
}
