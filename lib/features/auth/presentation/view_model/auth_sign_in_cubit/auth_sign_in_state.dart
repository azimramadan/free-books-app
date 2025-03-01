part of 'auth_sign_in_cubit.dart';

@immutable
sealed class AuthSignInState {}

final class AuthSignInInitial extends AuthSignInState {}

class AuthSignInLoading extends AuthSignInState {}

class AuthSignInSuccess extends AuthSignInState {
  final UserModel user;
  AuthSignInSuccess(this.user);
}

class AuthSignInFailure extends AuthSignInState {
  final String error;
  AuthSignInFailure({required this.error});
}
