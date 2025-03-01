import 'package:bookly_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  // Singleton Pattern
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  // Firebase Instances
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // التحقق مما إذا كان اسم المستخدم مستخدمًا
  Future<bool> isUsernameTaken(String username) async {
    try {
      QuerySnapshot querySnapshot =
          await firestore
              .collection("users")
              .where("username", isEqualTo: username)
              .limit(1)
              .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      throw Exception("Error checking username: ${e.toString()}");
    }
  }

  /// تسجيل مستخدم جديد
  Future<User?> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
      if (e.code == 'email-already-in-use') {
        throw Exception("This email is already in use.");
      } else if (e.code == 'weak-password') {
        throw Exception(
          "The password is too weak. Please choose a stronger one.",
        );
      } else if (e.code == 'invalid-email') {
        throw Exception("Invalid email address format.");
      } else {
        throw Exception("An error occurred while registering: ${e.message}");
      }
    } catch (e) {
      // Handle unexpected errors
      throw Exception("An unexpected error occurred: ${e.toString()}");
    }
  }

  // حفظ بيانات المستخدم في Firestore
  Future<void> saveUserData(String uid, Map<String, dynamic> userData) async {
    try {
      await firestore.collection("users").doc(uid).set(userData);
    } catch (e) {
      throw Exception("Failed to save user data. Please try again.");
    }
  }

  // تسجيل الدخول
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage =
              "No account found with this email. Please check and try again.";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password. Please try again.";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email format. Please enter a valid email.";
          break;
        case 'user-disabled':
          errorMessage =
              "This account has been disabled. Please contact support.";
          break;
        default:
          errorMessage =
              "An error occurred while logging in. Please try again later.";
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("An unexpected error occurred. Please try again.");
    }
  }

  // Get Email by Username
  Future<String?> getEmailByUsername({required String username}) async {
    try {
      QuerySnapshot querySnapshot =
          await firestore
              .collection("users")
              .where("username", isEqualTo: username)
              .limit(1)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first["email"];
      } else {
        throw Exception("No user found with this username.");
      }
    } catch (e) {
      throw Exception("Error fetching email: ${e.toString()}");
    }
  }

  Future<UserModel?> getUserData(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await firestore.collection("users").doc(uid).get();

      if (userDoc.exists) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Error fetching user data: ${e.toString()}");
    }
  }

  // تسجيل الخروج
  Future<void> logout() async {
    await auth.signOut();
  }
}
