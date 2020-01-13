import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/provider_config.dart';
import 'package:todo/i10n/localization_intl.dart';
import 'package:todo/model/global_model.dart';
import 'package:todo/pages/splash_page.dart';
import 'package:todo/utils/theme_util.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context)..setContext(context);

    return MaterialApp(
      //管理器显示的标题
      title: "待办事项",
      //本地化语言变更委托
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LanguageLocalizationsDelegate.delegate,
      ],
      //支持的本地化语言
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("zh", "CN"),
      ],
      //不支持语言的回调处理，当前语言/支持的语言列表
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        debugPrint("locale:$locale   sups:$supportedLocales");
        return Locale('zh', "CN");
      },
      //同上，应该只需要一个
      localeListResolutionCallback:
          (List<Locale> locales, Iterable<Locale> supportedLocales) {
        debugPrint("locatassss:$locales  sups:$supportedLocales");
        return Locale('zh', "CN");
      },
      locale: Locale('zh', "CN"),
      //当前的主题
//      theme: ThemeUtil.Instance.getTheme(),
      //主页面
      home: getHomePage(model.goToLogin, model.enableSplashAnimation),
    );
  }

  Widget getHomePage(bool goToLogin, bool enableSplashAnimation) {
    debugPrint("goToLogin:" + goToLogin.toString());
    if (goToLogin == null) return Container();
    if (enableSplashAnimation) return SplashPage();
    return goToLogin
        ? ProviderConfig.getInstance().getLoginPage(isFirst: true)
        : ProviderConfig.getInstance().getMainPage();
  }
}
