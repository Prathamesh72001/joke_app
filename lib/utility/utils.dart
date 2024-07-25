import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/view/widgets/common_text_widget.dart';

class Utils{
  static void prints(String tag, String message){
    if (kDebugMode) {
      print("$tag : $message");
    }
  }

  static void getSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content:  CommonTextWidget(
                text:message,fontweight: FontWeight.w500,
              )
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
}