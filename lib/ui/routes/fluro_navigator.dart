import 'dart:async';
import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'AppRouter.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      fluro_navigator
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/6/29 3:47 PM
/// @Description:     

/// 对路由添加跳转参数
/// 示例代码
/// ```
///     Navigators.push(context, addParams(AccountRouter.authPage,{'key':'value','key1','value1'}));
/// ```
String addParams(String path, Map params) {
  int length = params.length;
  StringBuffer result = StringBuffer(path)..write("?");
  params.forEach((key, value) {
    length--;
    result..write(key)..write("=")..write(Uri.encodeComponent(value));
    if (length != 0) {
      result..write("&");
    }
  });
  return result.toString();
}

class Navigators {
  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    AppRouter.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: Platform.isAndroid
            ? TransitionType.inFromRight
            : TransitionType.native);
  }

  static pushWithRouteSettings(
      BuildContext context, String path, RouteSettings routeSettings,
      {bool replace = false, bool clearStack = false}) {
    RouteMatch routeMatch = AppRouter.router.matchRoute(context, path,
        transitionType: Platform.isAndroid
            ? TransitionType.inFromRight
            : TransitionType.native,
        routeSettings: routeSettings);
    Route<dynamic> route = routeMatch.route;
    Completer completer = Completer();
    Future future = completer.future;
    if (routeMatch.matchType == RouteMatchType.nonVisual) {
      completer.complete("Non visual route type.");
    } else {
      if (route != null) {
        if (clearStack) {
          future =
              Navigator.pushAndRemoveUntil(context, route, (check) => false);
        } else {
          future = replace
              ? Navigator.pushReplacement(context, route)
              : Navigator.push(context, route);
        }
        completer.complete();
      } else {
        String error = "No registered route was found to handle '$path'.";
        print(error);
        completer.completeError(RouteNotFoundException(error, path));
      }
    }

    return future;
  }

  static pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    AppRouter.router
        .navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: Platform.isAndroid
            ? TransitionType.inFromRight
            : TransitionType.native)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print('$error');
    });
  }

  /// 返回
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  /// 带参数返回
  static void goBackWithResult<T extends Object>(
      BuildContext context, T result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  static void popUntil(BuildContext context, RoutePredicate predicate) {
    FocusScope.of(context).unfocus();
    Navigator.popUntil(context, predicate);
  }

  /// 跳转动画
  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}