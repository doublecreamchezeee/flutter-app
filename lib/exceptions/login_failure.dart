class LoginFailure implements Exception {
  final String message;

  const LoginFailure([this.message = "An unknown error occurred"]);

  factory LoginFailure.code(String code) {
    switch (code) {
      case 'INVALID_EMAIL':
        return const LoginFailure("Invalid email address.");
      case 'USER_NOT_FOUND':
        return const LoginFailure("User not found.");
      case 'WRONG_PASSWORD':
        return const LoginFailure("Incorrect password.");
      default:
        return const LoginFailure();
    }
  }
}
