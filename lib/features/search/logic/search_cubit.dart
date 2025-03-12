import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_debouncer/flutter_debouncer.dart';

import '../../../core/networking/result_or_failure.dart';
import '../data/models/detailed_github_user_model.dart';
import '../data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(const SearchInitial());

  Timer? _timer;
  static const _duration = Duration(milliseconds: 500);

  void fetchUsers(String userName) {
    // Add a debounce timer to avoid making a request on every keystroke
    _timer?.cancel();
    _timer = Timer(_duration, () => _fetchUsers(userName));
  }

  Future<void> _fetchUsers(String userName) async {
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

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
