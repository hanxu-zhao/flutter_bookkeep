import 'package:flutter/material.dart';
import 'package:flutterbookkeep/base/base_state.dart';
import 'package:flutterbookkeep/ui/account/login/login_page_viewmodel.dart';
import 'package:flutterbookkeep/ui/navigation/navigation_router.dart';
import 'package:flutterbookkeep/ui/routes/fluro_navigator.dart';
import 'package:flutterbookkeep/utils/size_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends BaseState<LoginPage, LoginPageViewmodel> {
  @override
  LoginPageViewmodel createViewModel() {
    return LoginPageViewmodel();
  }

  @override
  Widget providerBuild(BuildContext context, LoginPageViewmodel viewModel) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          margin: EdgeInsets.fromLTRB(SizeAdapt().px(48), 0, SizeAdapt().px(48), 0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeAdapt().px(108),
              ),
              Container(
                child: Text("记账"),
              ),
              Container(
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(decoration: InputDecoration(labelText: "用户名")),
                      ),
                      Container(
                        child: TextFormField(decoration: InputDecoration(labelText: "密码")),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: MaterialButton(child: Text("登录"),onPressed: _checkLogin,),
              ),
              Container(
                child: MaterialButton(child: Text("稍后登录"),onPressed: _pushNavigationPage,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkLogin() {
    _pushNavigationPage();
  }

  void _pushNavigationPage() {
      Navigators.push(context, NavigationRouter.navigationPage);
  }
}
