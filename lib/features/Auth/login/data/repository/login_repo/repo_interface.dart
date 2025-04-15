import 'package:ecommerce/features/Auth/login/data/models/user_response.dart';

abstract class LoginRepo {
  Future<UserResponse> login (String email , String password);
}
