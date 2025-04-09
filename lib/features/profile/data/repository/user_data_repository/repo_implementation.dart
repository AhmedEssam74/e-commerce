import 'dart:convert';
import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/profile/data/models/user_data_model/user_data_model.dart';
import 'package:ecommerce/features/profile/data/repository/user_data_repository/repo_interface.dart';
import 'package:http/http.dart' as http;

class GetUserDataRepoImpl implements GetUserDataRepo {
  @override
  Future<UserDataResponse> getUserData() async {
    final accessToken = await TokenStorage.getAccessToken();
    final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.getUserData);
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = await jsonDecode(response.body);
      UserDataResponse userDataResponse = UserDataResponse.fromJson(json);
      return userDataResponse;
    } else {
      throw Exception("Error with data");
    }
  }
}
