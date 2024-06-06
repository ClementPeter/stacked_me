import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  //onViewModelReady is used to run function once the ViewModel is first created or re-created
  @override
  void onViewModelReady(StartupViewModel viewModel) {
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.runTimedStartupLogic());
  }

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'STACKED',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text("STARTUP_VIEW"),
            verticalSpaceSmall,
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 10,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.runManualStartupLogic,
              child: const Text("Manual Navigation"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
            const Text(
              "Page would AutoNavigate in",
              textAlign: TextAlign.center,
            ),
            verticalSpaceSmall,
            // buildTimer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween(begin: 5.0, end: 0),
                  duration: const Duration(seconds: 5),
                  builder: (context, value, child) {
                    //print(value);
                    return Text(
                      "${value.toString().split(".").first} second(s)",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                  //Alternative to onViewModelReady
                  //onEnd: viewModel.runTimedStartupLogic,
                  //onEnd: viewModel.runStartupLogic,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
