enum AuthError { invalidPhoneNumber, unknown }

/*
I initially didn't want to create custom exceptions but I had to
since the default implementation of `toString` in Exception included
"Exception :" in the start.
 */

class AuthException implements Exception {
  final AuthError authError;
  final String message;

  AuthException(this.authError, this.message);

  @override
  String toString() {
    return message;
  }
}
