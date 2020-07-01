import 'package:flutter/material.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      base_view
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/7/1 1:39 PM
/// @Description:     

abstract class BaseView {
  BuildContext getContext();

  /// 显示Progress
  void showLoading({
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    RouteSettings routeSettings,
  });

  /// 关闭Progress
  void closeLoading();

  /// 展示Toast
  void showToast(String content);

  void showErrorDialog(String content);

  /// 跳转路由页面
  void navigatorPush(
      {@required String path, bool replace = false, bool clearStack = false});

  void navigatorPushResult(
      {@required String path,
        Function(Object) function,
        bool replace = false,
        bool clearStack = false});

  void navigatorGoBack();

  void navigatorGoBackWithResult<T extends Object>({@required T result});
}