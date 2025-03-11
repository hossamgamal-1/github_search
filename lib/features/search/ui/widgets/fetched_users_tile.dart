import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return const Center(child: CircularProgressIndicator());
          case SearchSuccess():
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final user = state.data[index];
                return GithubUserCard(user: user);
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
