
import 'package:flutter/material.dart';
import 'package:todo/json/color_bean.dart';
import 'package:todo/json/theme_bean.dart';
import 'package:todo/logic/global_logic.dart';
import 'package:todo/utils/theme_util.dart';

class GlobalModel extends ChangeNotifier{
  GlobalLogic logic;
  BuildContext context;

  String appName = "一日";

  ///是否开启闪屏动画
  bool enableSplashAnimation = true;

  ///是否进入登录页
  bool goToLogin;

  ///当前的主题颜色数据
  ThemeBean currentThemeBean = ThemeBean(
    themeName: 'pink',
    colorBean: ColorBean.fromColor(MyThemeColor.defaultColor),
    themeType: MyTheme.defaultTheme,
  );

  ///是否开启主页背景渐变
  bool isBgGradient = false;

  ///是否开启主页背景颜色跟随卡片图标颜色
  bool isBgChangeWithCard = false;

  ///是否开启卡片图标颜色跟随主页背景
  bool isCardChangeWithBg = false;

  ///是否开启主页卡片无限循环滚动
  bool enableInfiniteScroll = false;

  ///是否开启天气
  bool enableWeatherShow = false;

  ///是否开启主页背景为网络图片
  bool enableNetPicBgInMainPage = false;

  ///当前主页网络背景图片地址
  String currentMainPageBgUrl = "";

  ///当前位置信息(经纬度)
  String currentPosition = "";

//  ///当前天气的json
//  WeatherBean weatherBean;

  ///当前语言
  List<String> currentLanguageCode = ["zh", "CN"];
  String currentLanguage = "中文";
  Locale currentLocale;

  ///导航栏头部选择网络图片时的图片地址
  String currentNetPicUrl = "";

  GlobalModel(){
    logic = GlobalLogic(this);
  }

  void setContext(BuildContext context){
    if(this.context==null){
      this.context = context;
      //等待任务执行
      Future.wait([
        logic.getAppName(),
      ]).then((value){
//        currentLocale = Locale();
      });
    }
    goToLogin = true;
  }




}