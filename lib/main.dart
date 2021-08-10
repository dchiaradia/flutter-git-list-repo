import 'package:flutter/material.dart';

import 'package:get/get.dart';
/*
import 'Screens/SplashScreen/splashScreen.dart';
*/

import 'Screens/Dashboard/dashboardUI.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.native,
      locale: Locale('pt', 'BR'),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue[900],
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 5)),
        primaryColor: Colors.blue[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[900],
          padding: EdgeInsets.all(5),
          height: 36,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => DashboardPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
        ),
      ],
    ));
