import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'not_found_page.dart';
import 'router_provider.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      routes
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/6/29 3:49 PM
/// @Description:     

class Routes {

  static List<RouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          debugPrint('未找到目标页');
          return WidgetNotFound();
        });


    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
//    _listRouter.add(AccountRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}