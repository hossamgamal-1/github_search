import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/result_or_failure.dart';
import '../data/models/github_user_model.dart';
import '../data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(const SearchInitial());

  void fetchUsers(String userName) async {
    if (userName.isEmpty) return emit(const SearchInitial());

    emit(const SearchLoading());

    final result = await _searchRepo.fetchUsers(userName);

    if (isClosed) return;

    switch (result) {
      case SuccessResult():
        emit(SearchSuccess(result.data));
      case FailureResult():
        emit(SearchError(result.errorMessage));
    }
  }
}
