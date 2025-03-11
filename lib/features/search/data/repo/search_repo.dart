import '../../../../core/networking/result_or_failure.dart';
import '../../../../core/utils/functions.dart';
import '../data_source/search_remote_data_source.dart';
import '../models/detailed_github_user_model.dart';
import '../models/github_user_model.dart';

class SearchRepo {
  final SearchRemoteDataSource _searchDataSource;
  SearchRepo(this._searchDataSource);

  final Map<String, List<GithubUserModel>> _cachedUsers = {};
  Future<ResultOrFailure<List<GithubUserModel>>> fetchUsers(
    String userName,
  ) async {
    return tryCatchBlock(() async {
      if (_cachedUsers.containsKey(userName)) {
        return _cachedUsers[userName]!;
      }

      final users = await _searchDataSource.fetchUsers(userName);

      _cachedUsers.addAll({userName: users});

      return users;
    });
  }

  Future<ResultOrFailure<DetailedGithubUserModel>> fetchSingleUser(
    String userName,
  ) async {
    return tryCatchBlock(() => _searchDataSource.fetchSingleUser(userName));
  }
}
