import 'package:flutter/material.dart';
import 'package:form_stckd/ui/common/ui_helpers.dart';
import 'package:form_stckd/ui/views/email_verifier/email_verifier_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'email_verifier_viewmodel.dart';

//Forms in stacked
//1. stacked create view textReverse
//1b. Create our various TextFormField
//2. Add @FormView Annotation and specify controllers
//3. Run stacked generate to generate codegen files for Forms
//4. Automatic Text to ViewModel Synchronization
//4a. Import the generated form file
//4b. Mixin the $TextReverseView
//4c. Call the syncFormWithViewModel function when the viewModel is ready
//LAST (not per say)...
//Update ViewModel to extend from the FormViewModel instead of the BaseViewModel.
//Run stacked generate

@FormView(fields: [
  FormTextField(
    name: 'email',
    validator: EmailVerifierValidator.validateEmail,
  ),
])
class EmailVerifierView extends StackedView<EmailVerifierViewModel>
    with $EmailVerifierView {
  const EmailVerifierView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EmailVerifierViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('Email Verifier')),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceMedium,
            TextFormField(
              controller: emailController,
              autofocus: true,
              validator: EmailVerifierValidator.validateEmail,
              autovalidateMode: AutovalidateMode.always,
              decoration: const InputDecoration(
                hintText: "Enter email address",
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(EmailVerifierViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  EmailVerifierViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EmailVerifierViewModel();
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
///
///

// import 'package:flutter/material.dart';
// import 'package:form_stckd/ui/common/ui_helpers.dart';
// import 'package:form_stckd/ui/views/email_verifier/email_verifier_view.form.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked/stacked_annotations.dart';
// import 'email_verifier_viewmodel.dart';

// //Forms in stacked
// //1. stacked create view textReverse
// //1b. Create our various TextFormField
// //2. Add @FormView Annotation and specify controllers
// //3. Run stacked generate to generate codegen files for Forms
// //4. Automatic Text to ViewModel Synchronization
// //4a. Import the generated form file
// //4b. Mixin the $TextReverseView
// //4c. Call the syncFormWithViewModel function when the viewModel is ready
// //LAST (not per say)...
// //Update ViewModel to extend from the FormViewModel instead of the BaseViewModel.
// //Run stacked generate

//Initiate stacked generate code-gen 
// @FormView(fields: [
//   FormTextField(
//     name: 'email',
//     //validator: EmailVerifierValidator.validateEmail,
//   )
// ])
// class EmailVerifierView extends StackedView<EmailVerifierViewModel>
//     with $EmailVerifierView {
//   const EmailVerifierView({Key? key}) : super(key: key);

//   @override
//   Widget builder(
//     BuildContext context,
//     EmailVerifierViewModel viewModel,
//     Widget? child,
//   ) {
//     return Scaffold(
//       //backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: AppBar(title: const Text('Email Verifier')),
//       body: Container(
//         padding: const EdgeInsets.only(left: 25.0, right: 25.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             verticalSpaceMedium,
//             const Text(
//               'Email to Verify',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//             ),
//             TextFormField(
//               controller: emailController,
//               autofocus: true,
//               validator: EmailVerifierValidator.validateEmail,
//               autovalidateMode: AutovalidateMode.always,
//             ),
//             if (viewModel.hasEmailValidationMessage) ...[
//               verticalSpaceSmall,
//               // Text(
//               //   viewModel.emailValidationMessage!,
//               //   style: TextStyle(
//               //     //color: viewModel. ? Colors.green : Colors.red,
//               //     fontSize: 12,
//               //     fontWeight: FontWeight.w700,
//               //   ),
//               // ),
//             ]
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void onViewModelReady(EmailVerifierViewModel viewModel) {
//     syncFormWithViewModel(viewModel);
//     super.onViewModelReady(viewModel);
//   }

//   @override
//   EmailVerifierViewModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       EmailVerifierViewModel();
// }
