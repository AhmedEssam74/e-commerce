import 'dart:convert';
import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/Auth/login/data/models/user_response.dart';
import 'package:ecommerce/features/Auth/login/data/repository/repo_interface.dart';
import 'package:http/http.dart' as http;

class LoginRepoImpl implements LoginRepo {
  @override
  Future<UserResponse> login(String email, String password) async {
    final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = await jsonDecode(response.body);
      UserResponse userResponse = UserResponse.fromJson(json);
      if (userResponse.access != null && userResponse.refresh != null) {
        await TokenStorage.saveTokens(
            accessToken: userResponse.access!,
            refreshToken: userResponse.refresh!);
      }
      // final accessToken = await TokenStorage.getAccessToken();
      // // print(accessToken);
      return userResponse;
    } else {
      throw Exception('Email Or Password is Not Correct');
      // throw Exception('Login failed with status: ${response.statusCode}');
    }
  }
}
