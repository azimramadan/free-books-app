import 'package:bookly_app/core/services/firebase_service.dart';
import 'package:bookly_app/features/auth/data/models/user_model.dart';

class RegisterRepository {
  final FirebaseService firebaseService = FirebaseService();

  // Register a new user
  Future<UserModel?> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // تحقق إذا كان اسم المستخدم مستخدمًا بالفعل
      bool isTaken = await firebaseService.isUsernameTaken(username);
      if (isTaken) {
        throw Exception(
          "Username is already taken. Please choose another one.",
        );
      }

      // إنشاء مستخدم جديد
      var user = await firebaseService.registerUser(email, password);
      if (user == null) {
        throw Exception("User registration failed. Please try again.");
      }
      // Create a user model
      UserModel newUser = UserModel(
        uid: user.uid,
        username: username,
        email: email,
      );
      // Try saving user data in Firestore
      try {
        await firebaseService.saveUserData(user.uid, newUser.toMap());
      } catch (e) {
        await user.delete();
        throw Exception(e.toString());
      }

      return newUser;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
