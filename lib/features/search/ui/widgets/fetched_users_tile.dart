import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/utils/extensions.dart';
import '../../data/models/detailed_github_user_model.dart';
import '../../logic/search_cubit.dart';
import 'github_icon.dart';
import 'github_user_card.dart';

class FetchedUsersTile extends StatelessWidget {
  const FetchedUsersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listenWhen: (_, current) => current is SearchError,
      listener: (context, state) {
        if (state is! SearchError) return;

        context.showSnackBar(
          SnackBar(
            width: min(90.fromWidth, 450),
            backgroundColor: AppColors.red,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 1),
            content: Center(child: Text(state.message)),
          ),
        );
      },
      builder: (context, state) {
        switch (state) {
          case SearchLoading():
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  effect: ShimmerEffect(
                    baseColor: AppColors.backgroundWithOpacity,
                    highlightColor: AppColors.shimmerHighlight,
                  ),
                  child: GithubUserCard(user: DetailedGithubUserModel.skeleton),
                );
              },
            );

          case SearchSuccess():
            if (state.data.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    GithubIcon(),
                    Text(
                      'No users were found',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.foreground,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return GithubUserCard(user: state.data[index]);
              },
            );

          case SearchError():
          case SearchInitial():
            return const GithubIcon();
        }
      },
    );
  }
}
