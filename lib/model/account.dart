/*
import 'package:encrypt/encrypt.dart'; //hay que descargarlo npm install jsonwebtoken
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginResponseModel {
  final String? token;
  final String? error;

  LoginResponseModel({this.token, this.error});

  /*factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  } Medio loco esto*/
}

class LoginRequestModel {
  String _email;
  late String _password;

  LoginRequestModel({required String email, required String password})
      : _email = email {
    _password = _encriptar(password);
  }

  String _encriptar(password) {
    // encripta la contraseña
    final plainText = password;
    final key = Key.fromUtf8(')DY..P9*zbNx32GHe?Nb}V7gW-B{Pak7');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    return encrypted.base64;
  }

  String toJson() {
    Map<String, dynamic> map = {
      'email': _email.trim(),
      'password': _password.trim(),
    };

    return jsonEncode(map);
  }
}

Future<JsonCodec> login(LoginRequestModel requestModel) async {
  final url = Uri.http('localhost:4000', '/account/login');

  final response = await http.post(url, body: requestModel.toJson());
  if (response.statusCode == 200 || response.statusCode == 409) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load Data');
  }
}

/*int main() {
  var account = Account(email, password);

  account.registrarse()
  account.iniciarSesion()

}*/
*/