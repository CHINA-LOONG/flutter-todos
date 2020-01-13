

import 'package:flutter/material.dart';
import 'package:todo/logic/login_page_logic.dart';

class LoginPageModel extends ChangeNotifier{

   LoginPageLogic logic;
   BuildContext context;

   ///当前要播放的动画
   String currentAnimation="move";
   ///是否显示登录界面
   bool showLoginWidget = true;

   TextEditingController emlController = TextEditingController();
   TextEditingController pwdController = TextEditingController();

   bool isEmlOk = false;
   bool isPwdOk = false;
   bool isLoginNow = false;

  ///表示登录页面是不是第一个页面 ,是否显示返回按钮
  bool isFirst;

  final formKey = GlobalKey<FormState>();
//  CancelToken

  LoginPageModel({bool isFirst = false}){
    logic = LoginPageLogic(this);
    this.isFirst = isFirst;
  }

  void setContext(BuildContext context){
    if(this.context == null){
      this.context = context;
    }
  }

  @override
  void dispose() {
    emlController.dispose();
    pwdController.dispose();
    super.dispose();
    debugPrint("LoginPageModel销毁了");
  }

  void refresh(){
    notifyListeners();
  }

}