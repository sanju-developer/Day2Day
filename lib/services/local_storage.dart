import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  static const String ACCESS_TOKEN = 'accessToken';

  Future<String> getAccessToken() async {
    String token;
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      token = pref.getString(ACCESS_TOKEN);
    } catch (e) {
      token = null;
    }
    return token;
  }

  Future<void> setAccessToken(String accessToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(ACCESS_TOKEN, accessToken);
  }
}
