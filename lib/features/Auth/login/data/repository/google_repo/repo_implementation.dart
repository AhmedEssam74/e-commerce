import 'dart:convert';
import 'package:ecommerce/features/Auth/login/data/models/google_response_model.dart';
import 'package:ecommerce/features/Auth/login/data/models/user_response.dart';
import 'package:ecommerce/features/Auth/login/data/repository/google_repo/repo_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GoogleRepoImpl implements GoogleRepo {
  @override
  Future<GoogleResponseModel> googleLogin() async {
    final Uri url = Uri.parse(
        'https://api.malalshammobel.com/auth/google-auth/?redirect_uri=https://api.malalshammobel.com/auth/google-auth/callback/');
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = await jsonDecode(response.body);
      GoogleResponseModel googleResponseModel =
          GoogleResponseModel.fromJson(json);
      // debugPrint(googleResponseModel.googleLoginUrl);
      return googleResponseModel;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<UserResponse> openLink(String url) async {
    final Uri uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var json = await jsonDecode(response.body);
        UserResponse userResponse = UserResponse.fromJson(json);
        debugPrint('${userResponse.user}');
        return userResponse;
      } else {
        throw UnimplementedError();
      }
    } else {
      throw "Could not launch $url";
    }
  }

// static Future<UserResponse> openLink(String url) async {
//   final Uri uri = Uri.parse(url);
//   final response = await http.get(
//     uri,
//     headers: {'Content-Type': 'application/json'},
//   );
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
//   } else {
//     throw "Could not launch $url";
//   }
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     var json = await jsonDecode(response.body);
//     UserResponse userResponse = UserResponse.fromJson(json);
//     debugPrint('${userResponse.user}');
//     return userResponse;
//   }
//   else {
//     throw UnimplementedError();
//   }
// }
}
