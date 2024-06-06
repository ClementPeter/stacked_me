import 'package:flutter/material.dart';
import 'package:obsv_flutter/model/books.dart';
import 'package:stacked/stacked.dart';
import 'details_viewmodel.dart';

class DetailsView extends StackedView<DetailsViewModel> {
  final Items bookDetails;
  const DetailsView(this.bookDetails, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Book Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: NetworkImage(''))

          //   ),
          // ),
          const FlutterLogo(),
          Text(
            '${bookDetails.volumeInfo?.title}',
          ),
          Text(
            '${bookDetails.volumeInfo?.authors}',
          ),
        ],
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailsViewModel();
}


///Details view that works with BookJavCbk2 model
// class DetailsView extends StackedView<DetailsViewModel> {
//   final BookJavCbk2 bookDetails;
//   const DetailsView(this.bookDetails, {Key? key}) : super(key: key);

//   @override
//   Widget builder(
//     BuildContext context,
//     DetailsViewModel viewModel,
//     Widget? child,
//   ) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Container(
//         color: Colors.blueGrey,
//         padding: const EdgeInsets.only(left: 25.0, right: 25.0),
//       ),
//     );
//   }

//   @override
//   DetailsViewModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       DetailsViewModel();
// }
