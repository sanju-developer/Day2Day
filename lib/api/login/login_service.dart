import 'dart:async';
import 'package:chopper/chopper.dart';

part 'login_service.chopper.dart';

@ChopperApi(baseUrl: '/api/v1/users/login/')
abstract class LoginService extends ChopperService {
  static LoginService create([ChopperClient client]) => _$LoginService(client);

  @Post()
  Future<Response> userLogin(@Body() Map<String, String> body);
}
