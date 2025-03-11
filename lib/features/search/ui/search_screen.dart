import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../logic/search_cubit.dart';
import 'widgets/fetched_users_tile.dart';
import 'widgets/search_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Search')),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                spacing: 10,
                children: [
                  SearchTextField(
                    hintText: 'Search For Github Users',
                    onChanged: (userName) {
                      context.read<SearchCubit>().fetchUsers(userName);
                    },
                  ),

                  const Expanded(child: FetchedUsersTile()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
