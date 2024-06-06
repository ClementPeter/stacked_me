import 'package:my_first_app/app/app.bottomsheets.dart';
import 'package:my_first_app/app/app.dialogs.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  String get counterLabel => 'Go to Counter view';
  //String get result => _result.toString();

  int _result = 2;

  int get result => _result;

  final int _counter = 5;

  void incrementCounter() {}

  //Show dialog
  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  //"NavigateTo" counter view - Keeps home view in the navigation stack
  void navigateToCounterView() {
    //This navigates to counter view and keeps home view in the navigation stack
    //_navigationService.navigateToCounterView();

    //This navigates to counter view but removes Home view from the navigation stack
    // _navigationService.replaceWithCounterView();

    //trying custom route transition
    _navigationService.navigateTo(
      Routes.counterView,
      transition: TransitionsBuilders.slideBottom,
    );
  }

  //passing data back from route
  void navigateToCounterViewAndPassDataBack() async {
    final passedData = await _navigationService.navigateToCounterView();
    _result = passedData;
    print('Returned result: $result');
    rebuildUi();
  }

  void navigateToStartupView() {
    //Navigate to Startup view and removes home from the route
    _navigationService.replaceWithStartupView();

    //Navigate to Startup view and keep home in the route
    //_navigationService.navigateToStartupView();
  }

  //Show bottom sheet
  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
      showIconInMainButton: true,
      takesInput: true,
      showIconInSecondaryButton: true,
      isScrollControlled: true,
    );
  }
}
