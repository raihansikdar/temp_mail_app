import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:temp_mail_app/constants/app_colors.dart';

class AppToastMessage{
  AppToastMessage._();
  static void successToast({required String text}){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.appBarColors,
        textColor: AppColors.appBarTextColor,
        fontSize: 16.0
    );
  }
  static void failedToast({required String text}){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: AppColors.appBarTextColor,
        fontSize: 16.0
    );
  }
}