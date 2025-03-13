import '../../../../core/networking/result_or_failure.dart';
import '../../../../core/utils/functions.dart';
import '../../helpers/github_user_sorting_helper.dart';
import '../data_source/search_local_data_source.dart';
import '../data_source/search_remote_data_source.dart';
import '../models/detailed_github_user_model.dart';

class SearchRepo {
  final SearchRemoteDataSource _remoteDataSource;
  final SearchLocalDataSource _localDataSource;
  SearchRepo(this._remoteDataSource, this._localDataSource);

  Future<ResultOrFailure<List<DetailedGithubUserModel>>> fetchUsers(
    String userName,
  ) async {
    return tryCatchBlock(
      preFetch: () async => _localDataSource.getSearchHistory(userName),

      fetch: () async {
        final users = await _remoteDataSource.fetchUsers(userName);

        final detailedUsers = await Future.wait([
          for (final user in users) _fetchSingleUser(user.userName),
        ]);

        return GithubUserSortingHelper.sort(detailedUsers);
      },

      postFetch: (searchHistory) async {
        _localDataSource.saveSearchHistory(
          userName: userName,
          searchHistory: searchHistory,
        );
      },
    );
  }

  Future<DetailedGithubUserModel> _fetchSingleUser(String userName) async {
    final cachedUser = _localDataSource.getCachedUserDetails(userName);
    if (cachedUser != null) return cachedUser;

    final detailedUser = await _remoteDataSource.fetchSingleUser(userName);

    _localDataSource.saveCachedUserDetails(
      userName: userName,
      user: detailedUser,
    );

    return detailedUser;
  }
}
