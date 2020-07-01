import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      toaster
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/7/1 1:47 PM
/// @Description:     

class Toaster {
  static show(String msg,
      {duration = Toast.LENGTH_SHORT,
        gravity = ToastGravity.BOTTOM,
        textColor = Colors.white,
        backgroundColor = Colors.black38}) {
    if (msg == null) {
      return;
    }
    Fluttertoast.showToast(
        msg: msg,
        toastLength: duration,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor);
  }

  static cancelToast() {
    Fluttertoast.cancel();
  }
}