abstract class AppStates {}
class AppInitialState extends AppStates {}
class ChangeBottomNavBar extends AppStates {}
class ChangeSliderIndex extends AppStates {}
class GetDataLoadingState extends AppStates {}
class GetDataSuccessState extends AppStates {}
class GetDataErrorState extends AppStates {
  final String? error;
  GetDataErrorState(this.error);
}
