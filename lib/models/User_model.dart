class UserModel {
  String name;
  String email;
  String phone;
  String password;
  String image;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'image': image,
    };
  }
}
