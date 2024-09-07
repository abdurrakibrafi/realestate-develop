class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  String toString() {
    return "$_prefix $_message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No Internet: ");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message]) : super(message, "Request Time Out: ");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internal Server Error: ");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, "Invalid URL: ");
}

class InvalidSyntaxException extends AppExceptions {
  InvalidSyntaxException([String? message]) : super(message, "Invalid Syntax: ");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "Error Fetching Data: ");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message]) : super(message, "Unauthorized: ");
}

class ForbiddenException extends AppExceptions {
  ForbiddenException([String? message]) : super(message, "Forbidden: ");
}

class NotFoundException extends AppExceptions {
  NotFoundException([String? message]) : super(message, "Not Found: ");
}

class ConflictException extends AppExceptions {
  ConflictException([String? message]) : super(message, "Conflict: ");
}

class TooManyRequestsException extends AppExceptions {
  TooManyRequestsException([String? message]) : super(message, "Too Many Requests: ");
}

class InternalServerErrorException extends AppExceptions {
  InternalServerErrorException([String? message]) : super(message, "Internal Server Error: ");
}

class NotImplementedException extends AppExceptions {
  NotImplementedException([String? message]) : super(message, "Not Implemented: ");
}

class BadGatewayException extends AppExceptions {
  BadGatewayException([String? message]) : super(message, "Bad Gateway: ");
}

class ServiceUnavailableException extends AppExceptions {
  ServiceUnavailableException([String? message]) : super(message, "Service Unavailable: ");
}

class GatewayTimeoutException extends AppExceptions {
  GatewayTimeoutException([String? message]) : super(message, "Gateway Timeout: ");
}
