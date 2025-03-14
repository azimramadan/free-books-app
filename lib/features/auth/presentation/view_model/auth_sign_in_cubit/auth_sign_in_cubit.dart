import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/shared/data/models/user_model.dart';
import 'package:bookly_app/features/auth/data/repositories/sign_in_repository%20.dart';
import 'package:meta/meta.dart';

part 'auth_sign_in_state.dart';

class AuthSignInCubit extends Cubit<AuthSignInState> {
  final SignInRepository signInRepository;

  AuthSignInCubit({required this.signInRepository})
    : super(AuthSignInInitial());
  void signInUser({required String input, required String password}) async {
    emit(AuthSignInLoading());
    try {
      final userModel = await signInRepository.signInUser(
        input: input,
        password: password,
      );

      if (userModel == null) {
        throw Exception("Failed to fetch user data.");
      }

      emit(
        AuthSignInSuccess(userModel),
      ); // إرجاع UserModel بعد جلبه من Firestore
    } catch (e) {
      emit(AuthSignInFailure(error: e.toString()));
    }
  }
}
