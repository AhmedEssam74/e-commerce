abstract class GetUserDataStates {}

class GetUserDataInitState extends GetUserDataStates {}

class GetUserDataSuccessState extends GetUserDataStates {}

class GetUserDataLoadingState extends GetUserDataStates {}

class GetUserDataErrorState extends GetUserDataStates {
  String error;

  GetUserDataErrorState(this.error);
}
