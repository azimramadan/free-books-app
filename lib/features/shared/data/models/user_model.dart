class UserModel {
  final String uid;
  final String username;
  final String email;
  final String? phone;
  final List<String> favoriteBooks;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    this.phone,
    this.favoriteBooks = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phone': phone,
      'favoriteBooks': favoriteBooks,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      favoriteBooks: List<String>.from(map['favoriteBooks'] ?? []),
    );
  }
}
