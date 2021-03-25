import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/blog/view/blog_screen.dart';
import 'package:weds360/pages/blog/view/blog_provider.dart';
import 'package:weds360/pages/categorys/view/categorys_provider.dart';

import 'package:weds360/pages/categorys/view/categorys_screen.dart';
import 'package:weds360/pages/drawer/view/drawer_screen.dart';
import 'package:weds360/pages/home/view/home_provider.dart';

import 'package:weds360/pages/home/view/home_screen.dart';
import 'package:weds360/pages/login/view/forget_password/forget_password_provider.dart';
import 'package:weds360/pages/login/view/login_provider.dart';
import 'package:weds360/pages/login/view/login_screen.dart';
import 'package:weds360/pages/messeges/view/messeges_screen.dart';

import 'package:weds360/pages/onbording/view/onbording_screen.dart';
import 'package:weds360/pages/profile/view/profile_screen.dart';
import 'package:weds360/pages/settings/view/settings_screen.dart';
import 'package:weds360/pages/signup/view/signup_screen.dart';

import 'core/helpers/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final firstTime = sharedPreferences.getBool(kFirstTime);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp(firstTime == null ? false : firstTime));
  });
}

class MyApp extends StatelessWidget {
  final bool onBordingFirstTime;
  MyApp(this.onBordingFirstTime);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProviedr(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgetPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BlogProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategorysProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weds360',
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child,
          );
        },
        theme: ThemeData(
          primaryColor: Color(0xFF046B69),
          scaffoldBackgroundColor: Color(0xFFF3F3F4),
          accentColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          errorColor: Colors.red[900],
          fontFamily: 'raleway',
          textTheme: Theme.of(context).textTheme.copyWith(
                headline1: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                subtitle1: TextStyle(
                  // fontFamily: 'raleway',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
                overline: TextStyle(
                  // fontFamily: 'raleway',
                  fontSize: 10.0,
                  fontWeight: FontWeight.w800,
                ),
                button: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                headline2: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
                subtitle2: TextStyle(
                  // fontFamily: 'raleway',
                  fontSize: 13.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
                headline3: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF046B69),
                ),
                bodyText1: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w800,
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
            //  onBordingFirstTime ,
            //  ?BottomNavBar.id,
            // :
            OnBordingScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          OnBordingScreen.id: (context) => OnBordingScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          DrawerScreen.id: (context) => DrawerScreen(),
          BlogScreen.id: (context) => BlogScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          SettingsScreen.id: (context) => SettingsScreen(),
          CategorysScreen.id: (context) => CategorysScreen(),
          MessegesScreen.id: (context) => MessegesScreen(),
        },
      ),
    );
  }
}
