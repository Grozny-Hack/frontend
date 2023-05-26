// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

import '../models/AuthModel.dart';
import 'api_service.dart';

class AuthService {
  final SharedPreferences prefs;

  String _token = '';

  get token => _token;

  AuthService({
    required this.prefs,
  }) {
    _token = prefs.getString('token') ?? '';
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    dynamic data = await APIService.postRequest(
      request: 'api/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    print(data);

    try {
      if (data != '' && data['payload'] != {}) {
        String accessTokenJson = AuthJson.fromJson(data).payload.accessToken;
        await prefs.setString('token', accessTokenJson);
        _token = accessTokenJson;
        return 'Token: ${accessTokenJson}';
      }
    } catch (e) {
      return 'Такого пользователя не существует или введен неправильный пароль.';
    }

    return 'Такого пользователя не существует или введен неправильный пароль.';
  }

  Future<String> regUser({
    required String username,
    required String email,
    required String password,
    String first_name = '',
    String last_name = '',
    String description = '',
  }) async {
    dynamic data = await APIService.postRequest(
      request: 'api/auth/registration',
      data: {
        'email': email,
        'password': password,
      },
    );

    try {
      if (data != '' && data['payload'] != '') {
        String accessTokenJson = AuthJson.fromJson(data).payload.accessToken;

        await prefs.setString('token', accessTokenJson);
        _token = accessTokenJson;
        return 'Token: ${accessTokenJson}';
      }
    } catch (e) {
      print(e);
      return 'Вероятно, такой пользователь существует. Попробуйте войти в аккаунт.';
    }

    return 'Вероятно, такой пользователь существует. Попробуйте войти в аккаунт.';
  }

  signOut() async {
    _token = '';
    await prefs.setString('token', _token);
  }

  static Future<String> askNeuralNetwork({
    required String message,
  }) async {
    String _answer = '';
    dynamic data = await APIService.postRequest(
      request: 'ask',
      queryParameters: {
        'query': message,
      },
    );
    try {
      if (data != '' && data['answer'] != '') {
        _answer = data['answer'];
        print(_answer);
        return _answer;
      }
    } catch (e) {
      print(e);
      return 'Ошибка';
    }

    return 'Ошибка';
  }
}