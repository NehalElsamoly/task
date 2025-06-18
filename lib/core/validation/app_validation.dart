import '../utils/exports.dart';

abstract class AppValidation {

  static String? Function(String?) emailValidation() => (String? email) {
    if (email == null || email.isEmpty) {
      return AppStrings.emailValidationError;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email.trim())) {
      return AppStrings.emailInvalidValidationError;
    }
    return null;
  };

  static String? Function(String?) phoneValidation() => (String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneValidationError;
    } else if (
    !RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value) &&
        !RegExp(
            r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$")
            .hasMatch(value)
    ) {
      return AppStrings.phoneInvalidValidationError;
    }
    return null;
  };

  static String? Function(String?) passwordValidation() => (String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.passwordValidationError;
    }
    return null;
  };

  static String? Function(String?) phoneNumberValidation() => (String? phone) {
    if (phone == null || phone.isEmpty) {
      return AppStrings.phoneValidationError;
    } else if (phone.length < 7) {
      return AppStrings.phoneNumberLengthError;
    }
    return null;
  };

  static String? Function(String?) egyptianPhoneNumberValidation() => (String? phone) {
    if (phone == null || phone.isEmpty) {
      return AppStrings.phoneValidationError;
    } else if (phone.length < 11) {
      return AppStrings.phoneValidationError ;
    } else if (!RegExp(r'^(?:\+201|01)?[0-2,5]{1}\d{8}$').hasMatch(phone)) {
      return AppStrings.phoneInvalidValidationError;
    }
    return null;
  };

  static String? Function(String?) nameValidation() => (String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nameValidationError;
    }
    return null;
  };
}
