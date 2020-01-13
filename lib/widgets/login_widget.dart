
import 'package:flutter/cupertino.dart';
import 'package:todo/model/login_page_model.dart';

class LoginWidget extends StatelessWidget{

  final LoginPageModel loginPageModel;
  const LoginWidget({Key key, @required this.loginPageModel}):super(key:key);

  @override
  Widget build(BuildContext context) {
    print("登录控件");
    return Container(
      margin: EdgeInsets.only(left: 40,right: 40),
      child: Form(
        key: loginPageModel.formKey,
        child: Center(

        ),
      ),
    );
  }
}