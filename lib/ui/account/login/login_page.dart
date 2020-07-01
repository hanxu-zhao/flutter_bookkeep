import 'package:flutter/material.dart';
import 'package:flutterbookkeep/base/base_state.dart';
import 'package:flutterbookkeep/ui/account/login/login_page_viewmodel.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends BaseState<LoginPage, LoginPageViewmodel> {
  @override
  LoginPageViewmodel createViewModel() {
    mViewModel = LoginPageViewmodel();
  }

  @override
  Widget providerBuild(BuildContext context, LoginPageViewmodel viewModel) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Image.asset("assets/images/logo.png"),
          ),
          Container(

          ),
          Container(

          ),
        ],
      ),
    );
  }
}
