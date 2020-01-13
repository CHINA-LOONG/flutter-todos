

import 'package:todo/model/login_page_model.dart';

class LoginPageLogic{
  final LoginPageModel _model;

  LoginPageLogic(this._model);

  void onExit(){
    _model.currentAnimation = "move_out";
    _model.showLoginWidget = false;
    _model.refresh();
  }

}