// ignore_for_file: public_member_api_docs, sort_constructors_first

class SignupRequestBody {
  final String username;
  final String password;
  final String confirmPassword;
  final String birthday;
  final String name;
  SignupRequestBody({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.birthday,
    required this.name,
  });
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "confirmPassword": confirmPassword,
      "birthday": birthday,
      "name": name,
    };
  }
}
