///The Last section (Snippet 3) is the full connected App
///use it with Demo Instance Experiment 3
///
///
///
///
///TODO: For Demo Experiment 0

///Works with Demo Experiment 1 ApiService
import 'package:flutter/material.dart';
import 'package:obsv_flutter/app/app.logger.dart';
import 'package:obsv_flutter/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'home_viewmodel.dart';

@FormView(
  fields: [FormTextField(name: 'searchTerm')],
)
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onDispose(HomeViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final logger = getLogger('HomeView');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchBar(
                controller: searchTermController,
                trailing: [
                  IconButton(
                    onPressed: () async {
                      if (searchTermController.text.isEmpty) {
                        return;
                      } else {
                        await viewModel.fetchData();
                      }
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Builder(
                  builder: (context) {
                    //Error state
                    if (viewModel.hasError) {
                      return Center(
                        child: Text(
                          viewModel.modelError ?? "No Internet connection",
                        ),
                      );
                    }
                    // viewModel.hasError
                    //     ? Text('${viewModel.modelError}')
                    //     : const Text('No Internet connection');
                    //Loading
                    if (viewModel.isBusy) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Getting book data'),
                            SizedBox(height: 10),
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }
                    // Empty
                    if (viewModel.data == null) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No Book info found; Click the refresh Icon'),
                        ],
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.data?.length,
                      itemBuilder: (context, index) {
                        final bookData = viewModel.data?[index];
                        //logger.i('bookData::::${bookData.volumeInfo.title}');
                        //logger.i('data length::::${viewModel.data.length}');

                        return Card(
                          child: ListTile(
                            onTap: () {
                              viewModel.navigateToBookDetail(
                                  bookData: bookData);

                              //Avoid using bang operators as much as possible
                              // viewModel.navigateToBookDetail(
                              //     bookData: bookData!);
                            },
                            title: Text(bookData.volumeInfo?.title! ?? '--'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.fetchData(),
        mini: true,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    final logger = getLogger('HomeView');
    logger.i('onViewModelReady called');

    syncFormWithViewModel(viewModel);
  }

  //Try this out instead of onViewModelReady
  @override
  void syncFormWithViewModel(FormStateHelper model) {
    // TODO: implement syncFormWithViewModel
    final logger = getLogger('HomeView');
    logger.i('syncFormWithViewModel called');
    super.syncFormWithViewModel(model);
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

//
//
//
//
//
//
//
//
//
//
//
//
//
//
///

// // ///Works with Demo 2 ApiService
// import 'package:flutter/material.dart';
// import 'package:obsv_flutter/app/app.logger.dart';
// import 'package:stacked/stacked.dart';
// import 'home_viewmodel.dart';

// class HomeView extends StackedView<HomeViewModel> {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   Widget builder(
//     BuildContext context,
//     HomeViewModel viewModel,
//     Widget? child,
//   ) {
//     final logger = getLogger('HomeView');
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Builder(
//             builder: (context) {
//               //Loading
//               if (viewModel.isBusy) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               //Error state
//               if (viewModel.hasError) {
//                 return Center(
//                   child: Text(viewModel.modelError ?? "No Internet connection"),
//                 );
//                 //return viewModel.showInternetErrorDialog();
//               }
//               // Empty
//               if (viewModel.data == null || viewModel.data!.isEmpty) {
//                 return const Center(
//                   child: Text('No Book info found'),
//                 );
//               }

//               return ListView.builder(
//                 itemCount: viewModel.data?.length ?? 1,
//                 itemBuilder: (context, index) {
//                   final bookData = viewModel.data?[index];

//                   String? title =
//                       bookData?.volumeInfo?.title ?? 'Unknown Title';
//                   return Card(
//                     child: ListTile(
//                       onTap: () {},
//                       title: Text(title!),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   HomeViewModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       HomeViewModel();
// }

//
//
//
//
//
//
//
///Snippet 3
///Works with Instance 3 -> works with "Demo Instance Experiment 3" in ApiService

// import 'package:flutter/material.dart';
// import 'package:obsv_flutter/app/app.logger.dart';
// import 'package:obsv_flutter/ui/views/home/home_view.form.dart';
// import 'package:stacked/stacked.dart';
// import 'package:obsv_flutter/ui/common/app_colors.dart';
// import 'package:obsv_flutter/ui/common/ui_helpers.dart';
// import 'package:stacked/stacked_annotations.dart';

// import 'home_viewmodel.dart';

// @FormView(
//   fields: [FormTextField(name: 'searchTerms')],
// )
// class HomeView extends StackedView<HomeViewModel> with $HomeView {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   Widget builder(
//     BuildContext context,
//     HomeViewModel viewModel,
//     Widget? child,
//   ) {
//     final logger = getLogger('HomeView');
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Builder(
//             builder: (context) {
//               //Loading / Data not yet ready
//               ///Data ready unfolds some unwanted behaviour after the isBusy is complete
//               // if (!viewModel.dataReady || viewModel.isBusy) {
//               if (viewModel.isBusy) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               //Error state
//               if (viewModel.hasError) {
//                 return Center(
//                   child: Text(viewModel.modelError ?? "Network ishh"),
//                 );
//               }
//               // Empty
//               if (viewModel.data == null || viewModel.data!.isEmpty) {
//                 return const Center(
//                   child: Text('No Book info found'),
//                 );
//               }

//               return ListView(
//                 //shrinkWrap: true,
//                 children: [
//                   TextField(controller: searchTermsController),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: viewModel.data?.length,
//                     itemBuilder: (context, index) {
//                       final bookData = viewModel.data[index];
//                       String title = bookData.volumeInfo.title;
//                       return Card(
//                         child: ListTile(
//                           onTap: () {
//                             viewModel.navigateToBookDetail(bookData: bookData);
//                           },
//                           title: Text(title),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void onViewModelReady(HomeViewModel viewModel) {
//     syncFormWithViewModel(viewModel);
//     super.onViewModelReady(viewModel);
//   }

//   @override
//   HomeViewModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       HomeViewModel();
// }
