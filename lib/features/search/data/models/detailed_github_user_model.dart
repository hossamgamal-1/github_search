import '../../../../core/helpers/date_time_helper.dart';
import 'github_user_model.dart';

class DetailedGithubUserModel extends GithubUserModel {
  final String name;
  final int publicRepos;
  final DateTime updatedAt;

  const DetailedGithubUserModel({
    required super.id,
    required this.name,
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
      userName: superModel.userName,
      avatarUrl: superModel.avatarUrl,
      userPageUrl: superModel.userPageUrl,
      name: json['name'] ?? '',
      publicRepos: json['public_repos'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  bool get hasManyRepos => publicRepos > 50;

  bool get hasUpdatedRecently =>
      DateTime.now().difference(updatedAt).inDays < 180;

  String get lastActive => DateTimeHelper.formatTimeDifference(updatedAt);

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'name': name,
      'public_repos': publicRepos,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  static final skeleton = DetailedGithubUserModel(
    name: 'name',
    publicRepos: 0,
    updatedAt: DateTime.now(),
    id: GithubUserModel.skeleton.id,
    userName: GithubUserModel.skeleton.userName,
    avatarUrl: GithubUserModel.skeleton.avatarUrl,
    userPageUrl: GithubUserModel.skeleton.userPageUrl,
  );
}
