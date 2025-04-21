import 'package:ecommerce/features/profile/data/models/user_data_model/user_data_model.dart';

abstract class GetUserDataRepo {
  Future<UserDataResponse> getUserData();

  Future<UserDataResponse> editUserData(
    String? firstName,
    String? lastName,
    String? phoneNumber,
  );
}
