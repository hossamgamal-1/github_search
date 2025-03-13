import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/theming/app_sizer.dart';
import '../logic/search_cubit.dart';
import 'widgets/fetch_users_bloc_consumer.dart';
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
            appBar: AppBar(title: const Text('Github Search')),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, _) {
                  return Center(
                    child: SizedBox(
                      width: min(100.fromWidth, 500),
                      child: Column(
                        spacing: 10,
                        children: [
                          SearchTextField(
                            hintText: 'Search For Github Users',
                            onChanged: (userName) {
                              context.read<SearchCubit>().fetchUsers(userName);
                            },
                          ),

                          const Expanded(child: FetchUsersBlocConsumer()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
