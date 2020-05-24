import 'package:chopper/chopper.dart';
import 'package:day2day/api/constants.dart';
import 'package:day2day/api/login/login_service.dart';

ChopperClient apiClient = ChopperClient(
  baseUrl: BASE_URL,
  converter: JsonConverter(),
  services: [
    LoginService.create(),
  ],
);
