/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class ForgotPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const ForgotPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory ForgotPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const ForgotPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const ForgotPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const ForgotPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const ForgotPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const ForgotPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}
