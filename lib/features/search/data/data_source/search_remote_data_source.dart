import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_request_model.dart';
import '../../../../core/networking/dio_helper.dart';
import '../models/detailed_github_user_model.dart';
import '../models/github_user_model.dart';

class SearchRemoteDataSource {
  final ApiHelper _apiHelper;
  const SearchRemoteDataSource(this._apiHelper);

  Future<List<GithubUserModel>> fetchUsers(String userName) async {
    final response = await _apiHelper.getData(
      ApiRequestModel(
        endPoint: ApiConstants.fetchUsersEP,
        queries: {'q': userName},
      ),
    );
    final items = response.data['items'] as List? ?? [];
    return items.map((json) => GithubUserModel.fromJson(json)).toList();
  }

  Future<DetailedGithubUserModel> fetchSingleUser(String userName) async {
    final response = await _apiHelper.getData(
      ApiRequestModel(endPoint: ApiConstants.fetchSingleUserEP(userName)),
    );

    return DetailedGithubUserModel.fromJson(response.data);
  }
}
