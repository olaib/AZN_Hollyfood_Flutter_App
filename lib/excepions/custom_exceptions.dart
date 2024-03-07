class CustomException implements Exception {
  final String message;
  CustomException(this.message);
  @override
  String toString() => message;
}

class LoginException extends CustomException {
  LoginException(super.message);
}

class LogoutException extends CustomException {
  LogoutException(super.message);
}