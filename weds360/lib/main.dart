import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/drawer/view/drawer_screen.dart';
import 'package:weds360/pages/home/view/home_provider.dart';
import 'package:weds360/pages/home/view/home_screen.dart';
import 'package:weds360/pages/login/view/forget_password/forget_password_provider.dart';
import 'package:weds360/pages/login/view/login_provider.dart';
import 'package:weds360/pages/login/view/login_screen.dart';
import 'package:weds360/pages/onbording/view/onbording_provider.dart';
import 'package:weds360/pages/onbording/view/onbording_screen.dart';
import 'package:weds360/pages/signup/view/signup_screen.dart';

import 'core/helpers/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final firstTime = sharedPreferences.getBool(kFirstTime);

  runApp(MyApp(firstTime == null ? false : firstTime));
}

class MyApp extends StatelessWidget {
  final bool onBordingFirstTime;
  MyApp(this.onBordingFirstTime);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProviedr(),
      child: ChangeNotifierProvider(
        create: (context) => ForgetPasswordProvider(),
        child: ChangeNotifierProvider(
          create: (context) => OnBordingProvider(),
          child: ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: MaterialApp(
              title: 'Weds360',
              theme: ThemeData(
                primaryColor: Colors.black,
                scaffoldBackgroundColor: Colors.white,
                accentColor: Colors.blueGrey,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                errorColor: Colors.red[900],
                textTheme: Theme.of(context).textTheme.copyWith(
                      headline1: TextStyle(
                        fontSize: 37.0,
                        fontWeight: FontWeight.w500,
                      ),
                      overline: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                      ),
                      button: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      headline2: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                      ),
                      subtitle2: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                      headline3: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      bodyText1: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
              ),
              supportedLocales: [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              localizationsDelegates: [
                AppLocalizations.delegate, // Custem localization For you App
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                // Check if the current device locale is supported
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode) {
                    return supportedLocale;
                  }
                }
                // If the locale of the device is not supported, use the first one
                // from the list (English, in this case).
                return supportedLocales.first;
              },
              initialRoute:
                  onBordingFirstTime ? HomeScreen.id : OnBordingScreen.id,
              routes: {
                LoginScreen.id: (context) => LoginScreen(),
                SignUpScreen.id: (context) => SignUpScreen(),
                OnBordingScreen.id: (context) => OnBordingScreen(),
                HomeScreen.id: (context) => HomeScreen(),
                DrawerScreen.id: (context) => DrawerScreen(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
