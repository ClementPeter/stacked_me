import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:theme_stckd/ui/common/ui_helpers.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'STACKED THEME SWITCHER!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            verticalSpaceMedium,
            MaterialButton(
              color: Colors.black,
              onPressed: viewModel.toggleTheme,
              child: const Text(
                "Toggle theme",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            verticalSpaceMedium,
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                viewModel.setThemeModeLight(context);
              },
              child: const Text(
                "Set Light theme",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            verticalSpaceMedium,
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                viewModel.setThemeModeDark(context);
              },
              child: const Text(
                "Set Dark theme",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
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
