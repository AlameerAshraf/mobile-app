import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/blog/view/blog_screen.dart';
import 'package:weds360/pages/blog/view/blog_provider.dart';
import 'package:weds360/pages/budgeter/view/budgeter_provider.dart';
import 'package:weds360/pages/budgeter/view/budgeter_screen.dart';
import 'package:weds360/pages/categorys/view/categorys_provider.dart';

import 'package:weds360/pages/categorys/view/categorys_screen.dart';
import 'package:weds360/pages/drawer/view/drawer_screen.dart';
import 'package:weds360/pages/edit_profile/view/edit_profile_screen.dart';
import 'package:weds360/pages/edit_profile/view/edit_profle_provider.dart';
import 'package:weds360/pages/guest_list/view/guest_list_provider.dart';
import 'package:weds360/pages/guest_list/view/guest_list_screen.dart';
import 'package:weds360/pages/home/view/home_provider.dart';

import 'package:weds360/pages/home/view/home_screen.dart';
import 'package:weds360/pages/login/view/forget_password/forget_password_provider.dart';
import 'package:weds360/pages/login/view/login_provider.dart';
import 'package:weds360/pages/login/view/login_screen.dart';
import 'package:weds360/pages/messeges/view/messeges_provider.dart';
import 'package:weds360/pages/messeges/view/messeges_screen.dart';

import 'package:weds360/pages/onbording/view/onbording_screen.dart';

import 'package:weds360/pages/registry/view/registry_provider.dart';
import 'package:weds360/pages/registry/view/registry_screen.dart';
import 'package:weds360/pages/settings/view/settings_provider.dart';
import 'package:weds360/pages/settings/view/settings_screen.dart';
import 'package:weds360/pages/signup/view/signup_provider.dart';

import 'package:weds360/pages/signup/view/signup_screen.dart';
import 'package:weds360/pages/single_blog/view/single_blog_provider.dart';
import 'package:weds360/pages/single_blog/view/single_blog_screen.dart';
import 'package:weds360/pages/single_message/view/single_,messasge_screen.dart';
import 'package:weds360/pages/single_message/view/single_message_provider.dart';
import 'package:weds360/pages/single_vendor/view/single_vendor_provider.dart';
import 'package:weds360/pages/single_vendor/view/single_vendor_screen.dart';
import 'package:weds360/pages/vendors/view/vendors_provider.dart';
import 'package:weds360/pages/vendors/view/vendors_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weds360/pages/wedding_detales/view/wedding_detales_provider.dart';
import 'package:weds360/pages/wedding_detales/view/wedding_detales_screen.dart';
import 'core/helpers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final firstTime = sharedPreferences.getBool(kFirstTime);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp(firstTime == null ? false : firstTime));
  });
}

class MyApp extends StatefulWidget {
  final bool onBordingFirstTime;
  static void setLocal(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  MyApp(this.onBordingFirstTime);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

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
        ChangeNotifierProvider(
          create: (context) => VendorsProvuder(),
        ),
        ChangeNotifierProvider(
          create: (context) => SingleVendorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SingleBlogProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BudgeterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GuestListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeddingDetalesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MessagesProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => SingleMessageProvider(),
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
          fontFamily: GoogleFonts.raleway().fontFamily,
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
        locale: _locale,
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
          SettingsScreen.id: (context) => SettingsScreen(),
          CategorysScreen.id: (context) => CategorysScreen(),
          MessegesScreen.id: (context) => MessegesScreen(),
          VendorsScreen.id: (context) => VendorsScreen(),
          SingleVendorScreen.id: (context) => SingleVendorScreen(),
          SingleBlogScreen.id: (context) => SingleBlogScreen(),
          BudgeterScren.id: (context) => BudgeterScren(),
          RegistryScreen.id: (context) => RegistryScreen(),
          GuestListScreen.id: (context) => GuestListScreen(),
          EditProfileScreen.id: (context) => EditProfileScreen(),
          WeddingDetalesScreen.id: (context) => WeddingDetalesScreen(),
          SingleMessageScreen.id : (context) => SingleMessageScreen(),
        },
      ),
    );
  }
}
