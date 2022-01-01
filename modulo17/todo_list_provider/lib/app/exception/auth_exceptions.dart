class AuthExceptions implements Exception {
  AuthExceptions({
    required this.message,
  });

  final String message;
}
