import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zubara/languagedata/appLocalizatin.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/providers/dataprovider.dart';
import 'package:zubara/screens/splash.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:overlay_support/overlay_support.dart';

import 'languagedata/language_constants.dart';

void dialogBox() {
  EasyLoading.instance
    ..backgroundColor = Colors.transparent
    ..progressColor = mainColor
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10
    ..textColor = lightGolden
    ..indicatorColor = lightGolden
    ..dismissOnTap = true
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorSize = 60
    ..maskType = EasyLoadingMaskType.black;
}

void main() async {
  dialogBox();

  runApp(MyApp());
  // WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  Locale _locale;

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
        User.userData.lang = locale.languageCode;
        print(User.userData.lang);
      });
    });
    super.didChangeDependencies();
  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      User.userData.lang = locale.languageCode;

      print(User.userData.lang);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: mainColor, systemNavigationBarColor: mainColor));
    return OverlaySupport(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<DataProvider>(
            create: (_) => DataProvider(),
            lazy: false,
          ),
          // ChangeNotifierProvider<LocationProvider>(
          //   create: (_) => LocationProvider(),
          //   lazy: false,
          // )
        ],
        child: MaterialApp(
          builder: EasyLoading.init(),
          locale: _locale,
          supportedLocales: [
            Locale("en", "US"),
            Locale("ar", "SA"),
          ],
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "tajawal",
            primaryColor: mainColor,
            accentColor: secondaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Splash(),
        ),
      ),
    );
  }
}
