import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'messages_all.dart';


class LanguageLocalizations{
  static Future<LanguageLocalizations> load(Locale locale){
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    print("name是：$localeName");
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new LanguageLocalizations();
    });
  }



  static LanguageLocalizations of(BuildContext context) {
    return Localizations.of<LanguageLocalizations>(context, LanguageLocalizations);
  }


  String get appName{
    return Intl.message("One Day List",name: "appName",desc: "app的名字");
  }


  String get login => Intl.message('login',name: 'login',desc: '登录');
  String get email => Intl.message('EMAIL',name: 'email',desc: '邮箱');


}



class LanguageLocalizationsDelegate extends LocalizationsDelegate<LanguageLocalizations>{
  static LanguageLocalizationsDelegate delegate = LanguageLocalizationsDelegate();
  const LanguageLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<LanguageLocalizations> load(Locale locale) {
    //3
    return  LanguageLocalizations.load(locale);
  }
  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(LanguageLocalizationsDelegate old) => false;

}