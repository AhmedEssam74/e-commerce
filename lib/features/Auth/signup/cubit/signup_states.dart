abstract class SignupStates {}
class InitSignupState extends SignupStates {}

class SignupSuccessState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupErrorState extends SignupStates {
  String error;

  SignupErrorState(this.error);
}
