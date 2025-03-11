import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theming/app_colors.dart';
import '../../data/models/github_user_model.dart';
import '../../logic/search_cubit.dart';
import 'github_user_card.dart';

class FetchedUsersTile extends StatelessWidget {
  const FetchedUsersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
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
                  child: const GithubUserCard(user: GithubUserModel.skeleton),
                );
              },
            );
          case SearchSuccess():
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return GithubUserCard(user: state.data[index]);
              },
            );

          case SearchError():
            return Center(child: Text(state.message));

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
