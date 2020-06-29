import 'package:flutter/material.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      not_found_page
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/6/29 3:50 PM
/// @Description:    未找到对应路由页

class WidgetNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("页面不存在"),
      ),
      body: Center(
        child: Text("页面不存在"),
      ),
    );
  }
}