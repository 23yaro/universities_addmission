import 'package:bloc/bloc.dart';

abstract class AuthEvent {}

class AuthCheckStatusEvent extends AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String login;
  final String password;

  AuthLoginEvent({
    required this.login,
    required this.password,
  });
}

enum AuthStateStatus { authorized, notAuthorized, inProgress }

abstract class AuthState {}

class AuthUnauthorizedState extends AuthState {}

class AuthAuthorizedState extends AuthState {}

class AuthFailureState extends AuthState {
  final Object error;

  AuthFailureState(this.error);
}

class AuthInProgressState extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();
  final _sessionDataProvider = SessionDataProvider();

  AuthBloc(AuthState initialState) : super(initialState) {
    on<AuthCheckStatusEvent>((event, emit) async {
      final sessionId = await _sessionDataProvider.getSessionId(0);
      final newState =
      sessionId != null ? AuthAuthorizedState() : AuthUnauthorizedState();
      emit(newState);
    });
    on<AuthLoginEvent>((event, emit) async {
      try {
        final sessionId = await _authApiClient.auth(
          username: event.login,
          password: event.password,
        );
        final accountId = await _accountApiClient.getAccountInfo(sessionId);
        await _sessionDataProvider.getSessionId(sessionId);
        await _sessionDataProvider.setAccountId(accountId);
        emit(AuthAuthorizedState());
      } catch (e) {
        emit(AuthFailureState(e));
      }
    });
    on<AuthLogoutEvent>((event, emit) async {
      try {
        await _sessionDataProvider.deleteSessionId();
        await _sessionDataProvider.deleteAccountId();
      } catch (e) {
        emit(AuthFailureState(e));
      }
    });
    add(AuthCheckStatusEvent());
  }
}

class AuthService {
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId(0);
    final isAuth = sessionId != null;
    return isAuth;
  }

  Future<void> login(String login, String password) async {
    final sessionId = await _authApiClient.auth(
      username: login,
      password: password,
    );
    final accountId = await _accountApiClient.getAccountInfo(sessionId);
    await _sessionDataProvider.getSessionId(sessionId);
    await _sessionDataProvider.setAccountId(accountId);
  }

  Future<void> logout() async {
    await _sessionDataProvider.deleteSessionId();
    await _sessionDataProvider.deleteAccountId();
  }
}

class SessionDataProvider {
  final String sessionId='';


  deleteAccountId() {}

  deleteSessionId() {}

  setAccountId(accountId) {}

  getSessionId(sessionId) {}
}

class AccountApiClient {
  getAccountInfo(sessionId) {}
}

class AuthApiClient {
  auth({required String username, required String password}) {}
}