part of 'auth_register_cubit.dart';

@immutable
sealed class AuthRegisterState {}

final class AuthRegisterInitial extends AuthRegisterState {}

class AuthRegisterLoading extends AuthRegisterState {}

class AuthRegisterSuccess extends AuthRegisterState {
  final UserModel user;
  AuthRegisterSuccess(this.user);
}

class AuthRegisterFailure extends AuthRegisterState {
  final String error;
  AuthRegisterFailure({required this.error});
}
