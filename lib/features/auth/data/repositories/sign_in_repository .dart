import 'package:bookly_app/core/services/firebase_service.dart';
import 'package:bookly_app/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepository {
  final FirebaseService firebaseService = FirebaseService();
  Future<UserModel?> signInUser({
    required String input,
    required String password,
  }) async {
    User? firebaseUser;

    if (isEmail(input)) {
      firebaseUser = await firebaseService.loginUser(input, password);
    } else {
      String? email = await firebaseService.getEmailByUsername(username: input);
      if (email == null) {
        throw Exception("No account found with this username.");
      }
      firebaseUser = await firebaseService.loginUser(email, password);
    }

    if (firebaseUser == null) return null;

    // جلب بيانات المستخدم من Firestore وتحويلها إلى UserModel
    UserModel? userModel = await firebaseService.getUserData(firebaseUser.uid);
    return userModel;
  }

  bool isEmail(String input) {
    return RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(input);
  }
}
