import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookkeep/base/base_state.dart';

import 'navigation_page_viewmodel.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:
/// @ClassName:      navigation_page
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/7/2 1:07 PM
/// @Description:

class NavigationPage extends StatefulWidget {
  @override
  NavigationPageState createState() {
    return NavigationPageState();
  }
}

class NavigationPageState
    extends BaseState<NavigationPage, NavigationPageViewmodel> {
  @override
  NavigationPageViewmodel createViewModel() {
    return NavigationPageViewmodel();
  }

  @override
  Widget providerBuild(
      BuildContext context, NavigationPageViewmodel viewModel) {
    return Scaffold();
  }
}
