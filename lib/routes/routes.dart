import 'package:flutter/material.dart';
import 'package:simrs_mata/ui/login_page/login_page.dart';
import 'package:simrs_mata/ui/main_page/main_page.dart';
import 'package:simrs_mata/ui/rekam_medik_page/cre_user_rm_page.dart';
import 'package:simrs_mata/ui/rekam_medik_page/upd_user_rm_page.dart';
import 'package:simrs_mata/ui/splash_page/splash_page.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String loginPage = '/login';
  static const String splashPage = '/splash';
  static const String mainPage = '/mainPage';
  static const String creUserRm = '/cre-user-rm';
  static const String updUserRm = '/upd-user-rm';

  static final routes = <String, WidgetBuilder>{
    loginPage: (BuildContext context) => LoginPage(),
    splashPage: (BuildContext context) => SplashPage(),
    mainPage: (BuildContext context) => MainPage(),
    creUserRm: (BuildContext context) => CreUserRmPage(),
    updUserRm: (BuildContext context) => UpdUserRmPage(),
  };
}
