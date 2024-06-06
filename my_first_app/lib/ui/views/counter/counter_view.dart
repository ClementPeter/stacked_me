import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/ui/common/app_colors.dart';

import 'counter_viewmodel.dart';

class CounterView extends StackedView<CounterViewModel> {
  const CounterView({
    Key? key,
  }) : super(key: key);

  @override
  CounterViewModel viewModelBuilder(BuildContext context) => CounterViewModel();

  @override
  Widget builder(
    BuildContext context,
    CounterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcBlue,
        //automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: viewModel.navigateToHomeView,
          icon: const Icon(Icons.arrow_back, color: kcVeryLightGrey),
        ),
        title: const Text(
          'Counter View',
          style: TextStyle(color: Colors.white),
          // style: appBarTextStyle,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0.1,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              viewModel.counter.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          verticalSpaceSmall,
          MaterialButton(
            color: Colors.black,
            onPressed: () {
              viewModel.pop();
            },
            child: const Text(
              'Go Back',
              style: TextStyle(color: Colors.white),
            ),
          ),
          verticalSpaceSmall,
          MaterialButton(
            color: Colors.black,
            onPressed: viewModel.popAndPassData,
            child: const Text(
              'Go Back and return Data',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Icon(Icons.add),
            onPressed: viewModel.incrementCounter,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 2,
            child: const Icon(Icons.remove),
            onPressed: viewModel.decrementCounter,
          ),
        ],
      ),
    );
  }
}
