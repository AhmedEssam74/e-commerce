abstract class SearchProductStates {}

class InitSearchProductState extends SearchProductStates {}

class SearchProductLoadingState extends SearchProductStates {}

class SearchProductSuccessState extends SearchProductStates {}

class SearchProductErrorState extends SearchProductStates {
  String error;

  SearchProductErrorState(this.error);
}
