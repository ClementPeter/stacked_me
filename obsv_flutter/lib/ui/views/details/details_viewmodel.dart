import 'package:obsv_flutter/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  pop() {
    _navigationService.back();
  }
}
