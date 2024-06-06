import 'package:flutter/material.dart';
import 'package:form_stckd/ui/common/ui_helpers.dart';
import 'package:form_stckd/ui/views/text_reverse/text_reverse_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'text_reverse_viewmodel.dart';

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

@FormView(
  fields: [
    FormTextField(
      name: 'reverseInput',
      validator: TextReverseValidators.validateReverseText, //181 lines .form
    ),
  ],
)
class TextReverseView extends StackedView<TextReverseViewModel>
    with $TextReverseView {
  const TextReverseView({Key? key}) : super(key: key);

  //Dispose forms
  @override
  void onDispose(TextReverseViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    TextReverseViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('Text Reverser')),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              const Text(
                'Text to Reverse',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              verticalSpaceSmall,
              TextFormField(controller: reverseInputController),
              if (viewModel.hasReverseInputValidationMessage) ...[
                verticalSpaceSmall,
                Text(
                  viewModel.reverseInputValidationMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
              verticalSpaceMedium,
              const Text(
                'Reversed Text',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              verticalSpaceTiny,
              Text(
                viewModel.reversedText,
                style: const TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpaceMedium,
              const Text(
                'Normal Text',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              MaterialButton(
                color: Colors.black,
                onPressed: viewModel.showValues,
                child: const Text(
                  'Show Inbuilt form values in console ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(reverseInputController.text)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(TextReverseViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  TextReverseViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TextReverseViewModel();
}
