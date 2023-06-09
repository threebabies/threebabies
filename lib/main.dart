// import 'package:flutter/material.dart';
import 'package:baby/TabViewController.dart';
import 'package:localization/localization.dart';

import 'Account/LoginPage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'Account/FirebaseUtils.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'ThemeManager.dart';
import 'package:shared_preferences/shared_preferences.dart';


// api : AIzaSyCqtHedTAXDlNcwwe3o8i8WB--saGuXu0E
// web : 336744937807-4b594bhe1nc46s87hr8ajnm8upf6taqr.apps.googleusercontent.com
// git hub: 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
@pragma('function')
// defaults write com.apple.finder AppleShowAllFiles NO
@pragma('weblink')
// oauth approval: https://console.cloud.google.com/apis/credentials/consent/edit?project=reference-baton-320808
// oauth redirect: https://console.cloud.google.com/apis/credentials?authuser=2&project=three-babies

@pragma('command localisation')
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/intl_*.arb

bool isDarkMode = false;
void main() async{
  Intl.defaultLocale = 'zh_TW'; // set default locale to Traditional Chinese
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseUtils().init();
  isDarkMode = await ThemeManager.isDarkMode();
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (context) => ProductViewModel(productService: null)),
  //       Provider(create: (context) => SomeOtherClass()),
  //     ],
  //     child: MyApp(),
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return MaterialApp(
      title: 'ThreeBabies'.i18n(),
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
        LocalJsonLocalization.delegate,
      ],
      theme: isDarkMode ? ThemeManager.darkTheme : ThemeManager.lightTheme, // set the theme based on the value of isDarkMode
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'Hants'), // add support for Traditional Chinese
      ],
      home: TabViewController(),
    );
  }
}


