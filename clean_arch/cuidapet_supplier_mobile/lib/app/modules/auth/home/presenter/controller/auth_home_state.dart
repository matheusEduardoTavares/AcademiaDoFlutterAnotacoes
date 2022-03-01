enum AuthStatus {
  empty,
  logged,
  unlogged,
}

class AuthHomeState {
  AuthHomeState({
    required this.userLoggedStatus
  });

  factory AuthHomeState.initial() => 
    AuthHomeState(userLoggedStatus: AuthStatus.empty);

  AuthHomeState copyWith({
    AuthStatus? authStatus,
  }) => AuthHomeState(
    userLoggedStatus: authStatus ?? userLoggedStatus
  );

  final AuthStatus userLoggedStatus;
}