abstract class HomeLayoutStates {}

class HomeLayoutAppInitialState extends HomeLayoutStates {}

class BottomNavState extends HomeLayoutStates {}

class LoadingState extends HomeLayoutStates {}

class GetUserSuccessState extends HomeLayoutStates {}

class GetUserErrorState extends HomeLayoutStates {
  String error;

  GetUserErrorState(this.error);
}
