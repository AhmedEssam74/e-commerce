import 'package:ecommerce/features/Auth/signup/cubit/signup_states.dart';
import 'package:ecommerce/features/Auth/signup/data/models/user_sginup_response.dart';
import 'package:ecommerce/features/Auth/signup/data/repository/repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupRepo repo;
  UserSignupResponse? userSignupResponse;

  SignupCubit(this.repo) : super(InitSignupState());

  void signup(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String password,
  ) async {
    try {
      emit(SignupLoadingState());
      userSignupResponse = await repo.signup(
        firstName,
        lastName,
        phoneNumber,
        email,
        password,
      );
      emit(SignupSuccessState());
    } catch (e) {
      emit(SignupErrorState("$e"));
      throw (e);
    }
  }
}
