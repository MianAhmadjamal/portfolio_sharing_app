class UserModel {
  String? uid;
  String? email;
  String? username;
  String? gender;

  UserModel({this.uid, this.email, this.username, this.gender});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        gender: map['gender']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'username': username, 'gender': gender};
  }
}
