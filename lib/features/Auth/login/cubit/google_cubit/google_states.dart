abstract class GoogleLoginStates {}
class GoogleLoginInitState extends GoogleLoginStates{}
class GoogleLoginLoadingState extends GoogleLoginStates{}
class GoogleLoginSuccessState extends GoogleLoginStates{}
class GoogleLoginErrorState extends GoogleLoginStates{
  String error;
  GoogleLoginErrorState(this.error);
}