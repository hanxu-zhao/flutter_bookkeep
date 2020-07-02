import 'package:fluro/fluro.dart';
import 'package:flutterbookkeep/ui/routes/router_provider.dart';

import 'navigation_page.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      navigation_router
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/7/2 1:16 PM
/// @Description:     

class NavigationRouter implements RouterProvider {
  static const String navigationPage = '/navigation/NavigationPage';

  @override
  void initRouter(Router router) {
    router.define(navigationPage,
        handler: Handler(
            handlerFunc: (_, params) => NavigationPage(
            )));

  }
}