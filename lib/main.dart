import 'dart:io';
import 'dart:ui';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterbookkeep/common/provider/locale_provider.dart';
import 'package:flutterbookkeep/ui/home/home_page.dart';

import 'common/manager/storage_manager.dart';
import 'generated/l10n.dart';
import 'ui/routes/AppRouter.dart';
import 'ui/routes/routes.dart';
import 'utils/log_utils.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();

  runApp(MyApp(
    home: HomePage(),
  ));
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
  }
}

class MyApp extends StatelessWidget {
  final Widget home;

  MyApp({this.home}) {
    final router = Router();
    Routes.configureRoutes(router);
    AppRouter.router = router;
  }

  @override
  Widget build(BuildContext context) {
    var localeProvider = LocaleProvider();
    return MaterialApp(
      title: "Kinto",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.router.generator,
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        Log.e(
            "${locale.toString()} ${locale.languageCode} ${locale.countryCode} ${locale.scriptCode}",
            tag: this.runtimeType.toString());
        var supportedLanguageCodeList =
        supportedLocales.map((e) => e.languageCode).toList();
        if (supportedLanguageCodeList.contains(locale.languageCode)) {
          localeProvider
              .saveLocaleIndex(LocaleProvider.localeValueList.indexOf(locale.languageCode));
          return locale;
        } else {
          return localeProvider.locale;
        }
      },
      locale: localeProvider.locale,
      localizationsDelegates: [
        // 本地化的代理类
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}
