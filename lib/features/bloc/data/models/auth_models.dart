class UserModel {
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userImage;

  UserModel({this.userName, this.userEmail, this.userPhone, this.userImage});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_phone'] = userPhone;
    data['user_image'] = userImage;
    return data;
  }
}
