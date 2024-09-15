abstract class HomeState {}

class InitalHomeState extends HomeState {}

class GetSourceLoadingState extends HomeState {}

class GetSourceSuccessState extends HomeState {}

class GetSourceErrorState extends HomeState {
  String error;

  GetSourceErrorState(this.error);
}

class ChangeCategoryState extends HomeState {}

class ChangeTapState extends HomeState {}

class GetNewsLoadingState extends HomeState {}

class GetNewsSuccessState extends HomeState {}

class GetNewsErrorState extends HomeState {
  String error;

  GetNewsErrorState(this.error);
}

class ChangePageState extends HomeState {}

class DidNotEnterSearchQeuryYet extends HomeState {}

class SearchingState extends HomeState {}

class SearchIsNotExist extends HomeState {}
