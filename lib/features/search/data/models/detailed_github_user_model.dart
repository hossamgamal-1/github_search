import 'github_user_model.dart';

class DetailedGithubUserModel extends GithubUserModel {
  final int publicRepos;
  final DateTime updatedAt;

  const DetailedGithubUserModel({
    required super.id,
    required this.updatedAt,
    required super.userName,
    required super.avatarUrl,
    required this.publicRepos,
    required super.userPageUrl,
  });

  factory DetailedGithubUserModel.fromJson(Map<String, dynamic> json) {
    final superModel = GithubUserModel.fromJson(json);
    return DetailedGithubUserModel(
      id: superModel.id,
      avatarUrl: superModel.avatarUrl,
      userPageUrl: superModel.userPageUrl,
      userName: superModel.userName,
      publicRepos: json['public_repos'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
