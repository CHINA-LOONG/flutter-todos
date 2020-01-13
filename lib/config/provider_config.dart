import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'package:todo/model/global_model.dart';
import 'package:todo/model/login_page_model.dart';
import 'package:todo/model/main_page_model.dart';
import 'package:todo/pages/login_page.dart';
import 'package:todo/pages/main_page.dart';

class ProviderConfig{
  static ProviderConfig _instance;

  static ProviderConfig getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }

  ProviderConfig._internal();


  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child){
    return ChangeNotifierProvider<GlobalModel>(
      builder: (context) => GlobalModel(),
      child: child,
    );
  }

  ChangeNotifierProvider<MainPageModel> getMainPage(){
    return ChangeNotifierProvider<MainPageModel>(
      builder: (conttext)=>MainPageModel(),
      child: MainPage(),
    );
  }

  ChangeNotifierProvider<LoginPageModel> getLoginPage({bool isFirst = false}){
    return ChangeNotifierProvider<LoginPageModel>(
      builder: (context)=>LoginPageModel(isFirst: isFirst),
      child: LoginPage(),
    );
  }


}