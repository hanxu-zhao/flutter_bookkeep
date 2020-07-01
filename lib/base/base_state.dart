import 'package:flutter/material.dart';
import 'package:flutterbookkeep/ui/routes/fluro_navigator.dart';
import 'package:flutterbookkeep/utils/toaster_utils.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';
import 'base_viewmodel.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      base_state
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/7/1 1:38 PM
/// @Description:     

abstract class BaseState<V extends StatefulWidget, VM extends BaseViewModel>
    extends State<V> with BaseView, AutomaticKeepAliveClientMixin<V> {
  VM mViewModel;

  BaseState() {
    this.mViewModel = createViewModel();
    this.mViewModel.mView = this;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => mViewModel,
      child: providerBuild(context, mViewModel),
    );
  }

  VM createViewModel();

  Widget providerBuild(BuildContext context, VM viewModel);

  @override
  bool get wantKeepAlive => false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mViewModel?.onDidChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    mViewModel?.onDispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    mViewModel?.onDeactivate();
  }

  @override
  void didUpdateWidget(V oldWidget) {
    super.didUpdateWidget(oldWidget);
    mViewModel?.onDidUpdateWidget<V>(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    mViewModel?.onInitState();
  }

  @override
  void showToast(String content) => Toaster.show(content);

  @override
  BuildContext getContext() => context;

  @override
  void navigatorPush(
      {@required String path, bool replace = false, bool clearStack = false}) {
    Navigators.push(context, path, replace: replace, clearStack: clearStack);
  }

  @override
  void navigatorPushResult(
      {@required String path,
        Function(Object p1) function,
        bool replace = false,
        bool clearStack = false}) {
    Navigators.pushResult(context, path, function,
        replace: replace, clearStack: clearStack);
  }

  @override
  void navigatorGoBack() {
    Navigators.goBack(context);
  }

  @override
  void navigatorGoBackWithResult<T extends Object>({@required T result}) {
    Navigators.goBackWithResult(context, result);
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}