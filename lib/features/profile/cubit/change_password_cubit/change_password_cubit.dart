import 'package:ecommerce/features/profile/cubit/change_password_cubit/change_password_states.dart';
import 'package:ecommerce/features/profile/data/models/user_data_model/user_data_model.dart';
import 'package:ecommerce/features/profile/data/repository/change_password_repository/repo_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  UserDataResponse? userDataResponse;
  ChangePasswordRepo repo;

  ChangePasswordCubit(this.repo) : super(ChangePasswordInitState());

  void changePassword(String currentPassword, String newPassword) async {
    try {
      emit(ChangePasswordLoadingState());
      userDataResponse = await repo.changePassword(
        currentPassword,
        newPassword,
      );
      emit(ChangePasswordSuccessState());
    } catch (e) {
      emit(ChangePasswordErrorState("Invalid old password"));
      debugPrint('$e');
    }
  }
}
