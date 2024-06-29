class UserModel {
  String? userName;
  String? email;
  String? phoneNumber;
  String? password;

  UserModel(
      {required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String,dynamic> toJson()=>{
    'userName':userName,
    'email':email,
    'phoneNumber':phoneNumber,
    'password':phoneNumber,
  };
}
