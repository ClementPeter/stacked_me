import 'package:stacked/stacked.dart';

class EmailVerifierViewModel extends FormViewModel {}

class EmailVerifierValidator {
  static String? validateEmail(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'Enter an email address for verification';
    }
    if (value.contains(RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ))) {
      return 'Email is valid';
    } else {
      return "Email is not valid";
    }
  }
}
