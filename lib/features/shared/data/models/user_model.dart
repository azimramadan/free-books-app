class UserModel {
  final String uid;
  final String username;
  final String email;
  final String? phone;
  final String? address;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    this.address,
    this.phone,
  });

  //تحويل الكائن إلى Map لتخزينه في Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  //تحويل Map إلى كائن UserModel عند جلب البيانات من Firestore
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
    );
  }
}
