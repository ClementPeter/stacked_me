//import 'package:my_first_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  void runStartupLogic() async {
    //await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    // ReplaceWith vs NavigateTo
    // Replace : removes the previous screen in the Navigation Stack
    // Navigates : keeps the previous screen in the Navigation Stack

    //_navigationService.replaceWithCounterView();
    // _navigationService.navigateToCounterView();

    _navigationService.replaceWith(Routes.homeView);
    //_navigationService.navigateToHomeView();

    //trying out custom routing - not working for now
    // _navigationService.replaceWith(HomeView.homeRoute);
  }

  //Using onViewModelReady CALLBACK
  Future runTimedStartupLogic() async {
    await Future.delayed(const Duration(seconds: 5));
    // This is where you can make decisions on where your app should navigate to
    //_navigationService.navigateToHomeView();

    //This navigates to home view and clears the navigation stack behind
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  // //Using onViewModelReady CALLBACK
  // void runTimedStartupLogic() {
  //   // This is where you can make decisions on where your app should navigate when
  //   _navigationService.navigateToHomeView();
  // }

  void runManualStartupLogic() {
    _navigationService.navigateToHomeView();
  }
}
