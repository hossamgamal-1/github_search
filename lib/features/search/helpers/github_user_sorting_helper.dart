import '../data/models/detailed_github_user_model.dart';

class GithubUserSortingHelper {
  static List<DetailedGithubUserModel> sort(
    List<DetailedGithubUserModel> users,
  ) {
    return users..sort((a, b) {
      // First criterion: Users with 50+ repos come first
      if (a.hasManyRepos != b.hasManyRepos) {
        return a.hasManyRepos ? -1 : 1;
      }

      // Second criterion (only for 50+ users): Recent activity
      // Both users have 50+ repos here
      if (a.hasManyRepos && b.hasManyRepos) {
        if (a.hasUpdatedRecently != b.hasUpdatedRecently) {
          return a.hasUpdatedRecently ? -1 : 1;
        }
      }

      // Third criterion: Maintain original order (GitHub's relevance)
      return 0;
    });
  }
}
