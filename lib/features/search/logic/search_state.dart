part of 'search_cubit.dart';

sealed class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);
}

class SearchSuccess extends SearchState {
  final List<DetailedGithubUserModel> data;

  const SearchSuccess(this.data);
}
