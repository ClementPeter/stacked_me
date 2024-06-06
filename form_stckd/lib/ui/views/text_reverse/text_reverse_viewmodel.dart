import 'package:form_stckd/ui/views/text_reverse/text_reverse_view.form.dart';
import 'package:stacked/stacked.dart';

class TextReverseViewModel extends FormViewModel {
  String get reversedText =>
      hasReverseInput ? reverseInputValue!.split('').reversed.join('') : '---';

  //Displaying inbuilt stacked values
  void showValues() {
    print('reversedText: $reversedText ');
    print('listenableServices: $listenableServices ');
    print('fieldsValidationMessages: $fieldsValidationMessages');
    print('formValueMap: $formValueMap');

    print('hasAnyValidationMessage: $hasAnyValidationMessage');
    print('hasReverseInput: $hasReverseInput ');
    print(
        'hasReverseInputValidationMessage: $hasReverseInputValidationMessage');

    print('isFormValid: $isFormValid ');
    print('reverseInputValidationMessage: $reverseInputValidationMessage ');
    print('reverseInputValue: $reverseInputValue ');
    print('showValidationMessage: $showValidationMessage ');
    print('validationMessage: $validationMessage ');
    print('anyObjectsBusy: $anyObjectsBusy ');
    print('disposed: $disposed ');
    print('hasError: $hasError ');
    print('hashCode: $hashCode');
    print('isBusy: $isBusy');
    print('modelError: $modelError');
    print('onModelReadyCalled: $onModelReadyCalled');
    print('runtimeType: $runtimeType');

    print('---------');
  }
}

//Adding a validator
//Validator for TextFormField to detect numbers
//Run stacked generate
class TextReverseValidators {
  static String? validateReverseText(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'Enter a text';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'No numbers allowed';
    }
    return null;
  }
}
