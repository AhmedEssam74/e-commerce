abstract class ChangePasswordStates {}

class ChangePasswordInitState extends ChangePasswordStates {}

class ChangePasswordSuccessState extends ChangePasswordStates {}

class ChangePasswordLoadingState extends ChangePasswordStates {}

class ChangePasswordErrorState extends ChangePasswordStates {
  String error;

  ChangePasswordErrorState(this.error);
}