class GithubUserModel {
  final int id;
  final String userName;
  final String avatarUrl;
  final String userPageUrl;
  const GithubUserModel({
    required this.id,
    required this.userName,
    required this.avatarUrl,
    required this.userPageUrl,
  });

  factory GithubUserModel.fromJson(Map<String, dynamic> json) {
    return GithubUserModel(
      id: json['id'],
      userName: json['login'],
      avatarUrl: json['avatar_url'],
      userPageUrl: json['html_url'],
    );
  }

  static const skeleton = GithubUserModel(
    id: 1234,
    userName: 'userName',
    avatarUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHZqj-XReJ2R76nji51cZl4ETk6-eHRmZBRw&s',
    userPageUrl: '',
  );
}
