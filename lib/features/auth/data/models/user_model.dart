class UserModel {
  String? accessToken;
  String? refreshToken;
  int? id;
  String? username;
  String? email;
  String? phoneNumber;
  String? password;
  String? image;

  UserModel({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.password,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['image'] = this.image;
    return data;
  }
}
