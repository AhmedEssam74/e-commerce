import 'package:ecommerce/features/profile/data/models/user_data_model/user_data_model.dart';

abstract class ChangePasswordRepo {
  Future<UserDataResponse> changePassword(String currentPassword, String newPassword);
}
