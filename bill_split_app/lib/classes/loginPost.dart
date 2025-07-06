class LoginPost {
  final String email;
  final String password;
  
  LoginPost({
    required this.email,
    required this.password,
  });

  static String fromJson(Map<String,dynamic> json){
    return json['token']! as String;
  }
}