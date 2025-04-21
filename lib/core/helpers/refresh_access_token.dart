import 'dart:convert';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'token_storage.dart';

Future<String?> refreshAccessToken() async {
  final refreshToken = await TokenStorage.getRefreshToken();

  if (refreshToken == null) {
    debugPrint('No refresh token found.');
    return null;
  }

  final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.refreshToken);
  final headers = {'Content-Type': 'application/json'};

  final body = jsonEncode({
    'refresh': refreshToken,
  });

  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newAccessToken = data['access'];

      await TokenStorage.saveTokens(
        accessToken: newAccessToken,
        refreshToken: refreshToken,
      );
      debugPrint('Token refreshed and saved.');
      return newAccessToken;
    } else {
      debugPrint('Token refresh failed: ${response.body}');
      return null;
    }
  } catch (e) {
    debugPrint('Error refreshing token: $e');
    return null;
  }
}
