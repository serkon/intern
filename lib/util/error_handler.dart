import 'package:flutter/material.dart';
import 'package:flutter_login/config/error_constants.dart';
import 'package:flutter_login/widget/stateless/give_message.dart';

abstract class ErrorHandler {
  static String handleError(error) {
    switch (error) {
      // Do something to recover for special exceptions if needed like this
      case ErrorConstants.generalFailedToInitializeApp:
        return ErrorConstants.failedToInitializeApp;
      // Or just print the exception message
      default:
        return error.toString();
    }
  }
}