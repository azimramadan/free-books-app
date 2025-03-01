class UserModel {
  final String uid;
  final String username;
  final String email;

  UserModel({required this.uid, required this.username, required this.email});

  //تحويل الكائن إلى Map لتخزينه في Firestore
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'username': username, 'email': email};
  }

  //تحويل Map إلى كائن UserModel عند جلب البيانات من Firestore
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
