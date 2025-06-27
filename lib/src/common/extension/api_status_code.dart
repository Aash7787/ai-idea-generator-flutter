import 'package:http/http.dart';

extension StatusCode on Response {
  bool get isOk => statusCode == 200;
  bool get isBadRequest => statusCode == 400;
  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;
  bool get isNotFound => statusCode == 404;
  bool get isInternalServerError => statusCode == 500;
  bool get isServiceUnavailable => statusCode == 503;
  bool get isGatewayTimeout => statusCode == 504;
}


