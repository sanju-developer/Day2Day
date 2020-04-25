import 'package:http/http.dart' as http;

class API {
  Future<Object> apiCallForGet(url) async {
    var response = await http.get(url);
    print("api response from :::::::::::::::::::::::${response.body}");
    return response;
  }
}
