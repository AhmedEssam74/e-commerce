import 'package:ecommerce/features/Auth/login/data/models/google_response_model.dart';
import 'package:ecommerce/features/Auth/login/data/models/user_response.dart';

abstract class GoogleRepo {
  Future<GoogleResponseModel> googleLogin();
  Future<UserResponse> openLink(String url);
}
