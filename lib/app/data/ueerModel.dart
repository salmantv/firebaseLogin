class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? imageUrl;

  UserModel({this.email, this.name, this.phone, this.uid, this.imageUrl});

  factory UserModel.fromeMap(map) {
    return UserModel(
        email: map["email"],
        name: map["name"],
        phone: map["phone"],
        uid: map["uid"],
        imageUrl: map["image"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "phone": phone,
      "image": imageUrl
    };
  }
}
