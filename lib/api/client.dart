import 'package:chopper/chopper.dart';
import 'package:day2day/api/login/login_service.dart';

ChopperClient apiClient = ChopperClient(
  baseUrl: "http://10.0.2.2:8000",
  converter: JsonConverter(),
  services: [
    LoginService.create(),
  ],
);
