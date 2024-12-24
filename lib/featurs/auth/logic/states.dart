enum AuthStatus {
  init,
  loginSuccess,
  loginError,
  loginLoading,
  registerLoading,
  registerError,
  registerSuccess,
  isPasswordShoe,
  updateLevel;
}

extension AuthExtension on AuthStates {
  get isInit => authStatus == AuthStatus.init;

  // login state
  get isLoginError => authStatus == AuthStatus.loginError;
  get isLoginLoading => authStatus == AuthStatus.loginLoading;
  get isLoginSuccess => authStatus == AuthStatus.loginSuccess;
  // register state
  get isRegisterLoading => authStatus == AuthStatus.registerLoading;
  get isRegisterError => authStatus == AuthStatus.registerError;
  get isRegisterSuccess => authStatus == AuthStatus.registerSuccess;
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
