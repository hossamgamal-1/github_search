import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/theming/app_colors.dart';
import '../../data/models/detailed_github_user_model.dart';
import 'github_user_card.dart';

class UsersTile extends StatefulWidget {
  final List<DetailedGithubUserModel> users;
  const UsersTile({super.key, required this.users});

  @override
  State<UsersTile> createState() => _UsersTileState();
}

class _UsersTileState extends State<UsersTile> {
  final FocusNode _focusNode = FocusNode();
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void dispose() {
    _focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _focusNode.requestFocus(),
      child: KeyboardListener(
        focusNode: _focusNode,
        onKeyEvent: (value) {
          _timer?.cancel();
          _timer = Timer(const Duration(milliseconds: 150), () {
            if (value.physicalKey == PhysicalKeyboardKey.arrowDown) {
              if (_currentIndex < widget.users.length - 1) {
                setState(() => _currentIndex++);
              }
            } else if (value.physicalKey == PhysicalKeyboardKey.arrowUp) {
              if (_currentIndex > 0) {
                setState(() => _currentIndex--);
              }
            }
          });
        },
        child: ListView.builder(
          itemCount: widget.users.length,
          itemBuilder: (context, index) {
            final user = widget.users[index];
            return InkWell(
              highlightColor: AppColors.transparent,
              splashColor: AppColors.transparent,
              hoverColor: AppColors.transparent,
              key: ValueKey(user.id),
              onTap: () {
                _focusNode.requestFocus();
                final isChosen = index == _currentIndex;
                if (isChosen) {
                  launchUrlString(user.userPageUrl);
                } else {
                  setState(() => _currentIndex = index);
                }
              },
              child: GithubUserCard(
                user: user,
                isActivate: index == _currentIndex,
              ),
            );
          },
        ),
      ),
    );
  }
}
