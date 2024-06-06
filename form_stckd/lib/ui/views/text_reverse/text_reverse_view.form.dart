// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:form_stckd/ui/views/text_reverse/text_reverse_viewmodel.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ReverseInputValueKey = 'reverseInput';

final Map<String, TextEditingController>
    _TextReverseViewTextEditingControllers = {};

final Map<String, FocusNode> _TextReverseViewFocusNodes = {};

final Map<String, String? Function(String?)?> _TextReverseViewTextValidations =
    {
  ReverseInputValueKey: TextReverseValidators.validateReverseText,
};

mixin $TextReverseView {
  TextEditingController get reverseInputController =>
      _getFormTextEditingController(ReverseInputValueKey);

  FocusNode get reverseInputFocusNode =>
      _getFormFocusNode(ReverseInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_TextReverseViewTextEditingControllers.containsKey(key)) {
      return _TextReverseViewTextEditingControllers[key]!;
    }

    _TextReverseViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TextReverseViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TextReverseViewFocusNodes.containsKey(key)) {
      return _TextReverseViewFocusNodes[key]!;
    }
    _TextReverseViewFocusNodes[key] = FocusNode();
    return _TextReverseViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    reverseInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    reverseInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ReverseInputValueKey: reverseInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _TextReverseViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TextReverseViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TextReverseViewTextEditingControllers.clear();
    _TextReverseViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get reverseInputValue =>
      this.formValueMap[ReverseInputValueKey] as String?;

  set reverseInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ReverseInputValueKey: value}),
    );

    if (_TextReverseViewTextEditingControllers.containsKey(
        ReverseInputValueKey)) {
      _TextReverseViewTextEditingControllers[ReverseInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasReverseInput =>
      this.formValueMap.containsKey(ReverseInputValueKey) &&
      (reverseInputValue?.isNotEmpty ?? false);

  bool get hasReverseInputValidationMessage =>
      this.fieldsValidationMessages[ReverseInputValueKey]?.isNotEmpty ?? false;

  String? get reverseInputValidationMessage =>
      this.fieldsValidationMessages[ReverseInputValueKey];
}

extension Methods on FormStateHelper {
  setReverseInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ReverseInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    reverseInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ReverseInputValueKey: getValidationMessage(ReverseInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _TextReverseViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _TextReverseViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ReverseInputValueKey: getValidationMessage(ReverseInputValueKey),
    });
