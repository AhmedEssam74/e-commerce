import 'dart:convert';

import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/profile/data/models/user_data_model/user_data_model.dart';
import 'package:ecommerce/features/profile/data/repository/change_password_repository/repo_interface.dart';
import 'package:http/http.dart' as http;

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  @override
  Future<UserDataResponse> changePassword(
      String currentPassword, String newPassword) async {
    final accessToken = await TokenStorage.getAccessToken();
    final Uri url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.changePassword);
    final response = await http.patch(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json'
      },
      body: {
        'old_password': currentPassword,
        'password': newPassword,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = await jsonDecode(response.body);
      UserDataResponse userDataResponse = UserDataResponse.fromJson(json);
      return userDataResponse;
    } else {
      throw Exception('Something went Wrong');
    }
  }
}
