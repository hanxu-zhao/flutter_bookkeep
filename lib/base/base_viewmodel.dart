import 'package:flutter/material.dart';

import 'base_view.dart';
import 'lifecycle.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:
/// @ClassName:      base_viewmodel
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/7/1 1:39 PM
/// @Description:

class BaseViewModel<V extends BaseView> extends Lifecycle with ChangeNotifier {
  bool _showPageLoad = true;

  bool get hashShowPageLoad => _showPageLoad;

  void showPageLoading() {
    _showPageLoad = true;
    notifyListeners();
  }

  void closePageLoading() {
    _showPageLoad = false;
    notifyListeners();
  }

  V mView;

  @override
  void onInitState() {}

  @override
  void onDispose() {
    /// 释放EventBus订阅
//    disposeEventBus();

    /// 销毁时，将请求取消
//    if (!_cancelToken.isCancelled) {
//      _cancelToken.cancel();
//    }
  }

  @override
  void onDeactivate() {}

  @override
  void onDidChangeDependencies() {}

  @override
  void onDidUpdateWidget<W>(W oldWidget) {}
}
