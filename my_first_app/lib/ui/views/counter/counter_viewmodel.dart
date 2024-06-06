import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

//View Model holds the functionality for the view
class CounterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void decrementCounter() {
    _counter--;
    rebuildUi();
  }

  void navigateToHomeView() {
    _navigationService.navigateToHomeView();
  }

  //Go one screen back
  void pop() {
    _navigationService.back();
  }

  //Go one screen back and pass data
  void popAndPassData() {
    _navigationService.back(result: _counter);
  }
}
