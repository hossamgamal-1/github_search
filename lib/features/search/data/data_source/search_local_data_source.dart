import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/detailed_github_user_model.dart';

class SearchLocalDataSource {
  final SharedPreferences _prefs;
  SearchLocalDataSource(this._prefs);

  static String _getSearchHistoryKey(String userName) =>
      'searchHistory_$userName';
  static String _getCachedUsersKey(String userName) => 'cachedUsers_$userName';

  List<DetailedGithubUserModel>? getSearchHistory(String userName) {
    final searchHistory = _prefs.getStringList(_getSearchHistoryKey(userName));

    if (searchHistory == null) return null;

    return searchHistory.map((stringObj) {
      final json = jsonDecode(stringObj);
      return DetailedGithubUserModel.fromJson(json);
    }).toList();
  }

  Future<void> saveSearchHistory({
    required String userName,
    required List<DetailedGithubUserModel> searchHistory,
  }) async {
    final strList =
        searchHistory.map((user) => jsonEncode(user.toJson())).toList();
    await _prefs.setStringList(_getSearchHistoryKey(userName), strList);
  }

  DetailedGithubUserModel? getCachedUserDetails(String userName) {
    final stringObj = _prefs.getString(_getCachedUsersKey(userName));

    if (stringObj == null) return null;

    return DetailedGithubUserModel.fromJson(jsonDecode(stringObj));
  }

  Future<void> saveCachedUserDetails({
    required String userName,
    required DetailedGithubUserModel user,
  }) async {
    await _prefs.setString(
      _getCachedUsersKey(userName),
      jsonEncode(user.toJson()),
    );
  }
}
