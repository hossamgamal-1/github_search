class ApiConstants {
  const ApiConstants._();

  static String? apiKey;
  static const baseUrl = 'https://api.github.com/';
  static const fetchUsersEP = 'search/users';
  static String fetchSingleUserEP(String userName) => 'users/$userName';
}
