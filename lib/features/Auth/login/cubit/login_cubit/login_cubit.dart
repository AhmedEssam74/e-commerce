import 'package:ecommerce/features/Auth/login/cubit/login_cubit/login_states.dart';
import 'package:ecommerce/features/Auth/login/data/models/user_response.dart';
import 'package:ecommerce/features/Auth/login/data/repository/login_repo/repo_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  UserResponse? userResponse;

  LoginRepo repo;

  LoginCubit(this.repo) : super(InitLoginState());

  void login(String email, String password) async {
    try {
      emit(LoginLoadingState());
      userResponse = await repo.login(email, password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState('$e'));
      debugPrint('$e');
    }
  }
}
