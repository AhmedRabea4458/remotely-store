import 'package:flutter/cupertino.dart';

import 'app_regexp.dart';

abstract class Validations {

  static String? validateEmail(BuildContext context, String? email) {
    if (email!.isEmpty || !AppRegExp.isEmailValid(email)) {
      return '🔴Email is required!';
    } else if (!email.contains('@')) {
      return '🔴Invalid Email!';
    }
    return null;
  }

  static String? validatePhoneNumber(BuildContext context, String? phoneNumber) {
    if (phoneNumber!.isEmpty || !AppRegExp.isPhoneNumberValid(phoneNumber)) {
      return '🔴Phone number is required!';
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? password) {
    if (password!.isEmpty || !AppRegExp.isPasswordValid(password)) {
      return '🔴Password is required!';
    }
    return null;
  }




}