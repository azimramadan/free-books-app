import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/shared/data/models/user_model.dart';
import 'package:bookly_app/features/auth/data/repositories/register_repository%20.dart';
import 'package:meta/meta.dart';

part 'auth_register_state.dart';

class AuthRegisterCubit extends Cubit<AuthRegisterState> {
  final RegisterRepository registerRepository;

  AuthRegisterCubit({required this.registerRepository})
    : super(AuthRegisterInitial());

  void registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(AuthRegisterLoading());
    try {
      final user = await registerRepository.registerUser(
        username: username,
        email: email,
        password: password,
      );
      emit(AuthRegisterSuccess(user!));
    } catch (e) {
      emit(AuthRegisterFailure(error: e.toString()));
    }
  }
}
