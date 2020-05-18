import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:day2day/api/constants.dart';

part 'login_service.chopper.dart';

@ChopperApi(baseUrl: '$API_URL$LOGIN_ENDPOINT')
abstract class LoginService extends ChopperService {
  static LoginService create([ChopperClient client]) => _$LoginService(client);

  @Post()
  Future<Response> userLogin(@Body() Map<String, String> body);
}
