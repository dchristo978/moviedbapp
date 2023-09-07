import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FToast{
  static FToast? _instance;

  FToast._();

  factory FToast() =>_instance ?? FToast._();

  void successToast(String title){
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

  void warningToast(String? title){
    Fluttertoast.showToast(
      msg: title ?? '',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.yellowAccent,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  void errorToast(String title){
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}