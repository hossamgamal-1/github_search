import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../data/models/detailed_github_user_model.dart';

class GithubUserCard extends StatelessWidget {
  final DetailedGithubUserModel user;
  final bool isActivate;
  const GithubUserCard({
    super.key,
    required this.user,
    required this.isActivate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: isActivate ? AppColors.blue : AppColors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        tileColor: AppColors.backgroundWithOpacity,
        title: Text(user.name),
        titleTextStyle: const TextStyle(
          fontSize: 22,
          color: AppColors.foreground,
        ),

        subtitle: Text('@${user.userName}'),
        subtitleTextStyle: const TextStyle(fontSize: 14, color: AppColors.blue),

        leading: CircleAvatar(
          backgroundColor: AppColors.grey,
          backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
        ),
        trailing: _getTrailingWidget(),
      ),
    );
  }

  Widget? _getTrailingWidget() {
    if (!isActivate) return null;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Public Repos: ${user.publicRepos}',
          style: TextStyle(
            color: user.hasManyRepos ? Colors.green : AppColors.foreground,
          ),
        ),
        Text(
          'lastActive: ${user.lastActive}',
          style: TextStyle(
            color:
                user.hasUpdatedRecently
                    ? AppColors.green
                    : AppColors.foreground,
          ),
        ),
      ],
    );
  }
}
