


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/config/keys.dart';
import 'package:todo/model/global_model.dart';
import 'package:todo/utils/shared_util.dart';
import 'package:todo/utils/theme_util.dart';

class GlobalLogic{
  final GlobalModel _model;
  GlobalLogic(this._model);


  ///获取app的名字
  Future getAppName() async{
    final appName = await SharedUtil.instance.getString(Keys.appName);
    if (appName==null) return;
    if (appName== _model.appName) return;
    _model.appName = appName;
  }

  Color getBgInDark(){
    final themeType = _model.currentThemeBean.themeType;
    return themeType==MyTheme.darkTheme?Colors.grey[800] : Colors.white;
  }


}