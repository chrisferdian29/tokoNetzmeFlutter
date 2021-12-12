//Custom class in project directory
import 'package:flutter/material.dart';

class ReuseWidgets {
  ReuseWidgets._();
  static buildErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }

  static showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 16),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      useRootNavigator: false,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}