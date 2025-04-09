import 'dart:convert';
import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/Auth/signup/data/models/user_sginup_response.dart';
import 'package:ecommerce/features/Auth/signup/data/repository/repo_interface.dart';
import 'package:http/http.dart' as http;

class SignupRepoImpl implements SignupRepo {
  @override
  Future<UserSignupResponse> signup(String firstName, String lastName,
      String phoneNumber, String email, String password) async {
    final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.signupUrl);
    final response = await http.post(
      url,
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = await jsonDecode(response.body);
      UserSignupResponse userSignupResponse = UserSignupResponse.fromJson(json);
      if (userSignupResponse.access != null &&
          userSignupResponse.refresh != null) {
        await TokenStorage.saveTokens(
            accessToken: userSignupResponse.access!,
            refreshToken: userSignupResponse.refresh!);
      }
      // final accessToken = await TokenStorage.getAccessToken();
      // // print(accessToken);
      return userSignupResponse;
    } else {
      // throw Exception('Email is Already Exist');
      throw Exception(response.body);
    }
  }
}
