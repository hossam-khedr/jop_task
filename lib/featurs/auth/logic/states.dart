enum AuthStatus {
  init,
  loading,
  error,
  success,
  isPasswordShoe,
  updateLevel;
}

extension AuthExtension on AuthStates {
  get isInit => authStatus == AuthStatus.init;

  get isLoading => authStatus == AuthStatus.loading;

  get isError => authStatus == AuthStatus.error;

  get isSuccess => authStatus == AuthStatus.success;
}

class AuthStates {
  String? errorMessage;
  AuthStatus authStatus;
  bool obscureText;
  String experienceLevel;

  AuthStates({
    this.authStatus = AuthStatus.init,
    this.errorMessage,
    this.obscureText = true,
    this.experienceLevel = 'fresh'
  });

  AuthStates copyWith({
    String? errorMessage,
    AuthStatus? authStatus,
    bool? obscureText,
    String? experienceLevel
  }) {
    return AuthStates(
      errorMessage: errorMessage ?? this.errorMessage,
      authStatus: authStatus ?? this.authStatus,
      obscureText: obscureText ?? this.obscureText,
      experienceLevel: experienceLevel ?? this.experienceLevel,
    );
  }
}
