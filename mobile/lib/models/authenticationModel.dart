class AuthenticationModel {
  String accessToken;

  AuthenticationModel({this.accessToken});

  AuthenticationModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }
}
