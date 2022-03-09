class FailureException implements Exception {
  String? message;

  FailureException([
    this.message,
  ]);
}