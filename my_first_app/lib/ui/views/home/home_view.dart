import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcBlack,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () {
        //     viewModel.navigateToStartupView();
        //   },
        //   icon: const Icon(Icons.arrow_back, color: kcVeryLightGrey),
        // ),
        title: const Text(
          'Home View',
          style: TextStyle(color: Colors.white),
          // style: appBarTextStyle,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0.1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    const Text(
                      'Hello, STACKED!',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: Colors.black,
                      onPressed: viewModel.navigateToCounterView,
                      child: Text(
                        viewModel.counterLabel,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: Colors.black,
                      onPressed: viewModel.navigateToCounterViewAndPassDataBack,
                      child: const Text(
                        'Go to Counter view model and get Data back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    verticalSpaceSmall,
                    Text('Data from counter UI is xyz ${viewModel.result}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: kcDarkGreyColor,
                      child: const Text(
                        'Show Dialog',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: viewModel.showDialog,
                    ),
                    MaterialButton(
                      color: kcDarkGreyColor,
                      child: const Text(
                        'Show Bottom Sheet',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: viewModel.showBottomSheet,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
