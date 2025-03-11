import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../data/models/github_user_model.dart';

class GithubUserCard extends StatelessWidget {
  final GithubUserModel user;
  const GithubUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      // padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      // color: AppColors.foreground,
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 22),
        child: ListTile(
          tileColor: Colors.black,
          textColor: AppColors.foreground,
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
          ),
          title: Text(user.userName),
          subtitle: Text(user.id.toString()),
        ),
      ),
    );
  }
}
