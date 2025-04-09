import 'package:ecommerce/features/Auth/signup/data/models/user_sginup_response.dart';

abstract class SignupRepo {
  Future<UserSignupResponse> signup(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String password,
  );
}
