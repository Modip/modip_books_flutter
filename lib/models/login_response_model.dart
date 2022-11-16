class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.data,
  });

  late final String message;
  late final String data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json[message];
    data = json[data];
  }
}
