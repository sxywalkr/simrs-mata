import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/ui/data_rekam_medik_page/cre_data_user_rm_page.dart';
import 'package:simrs_mata/ui/data_rekam_medik_page/idx_data_user_rekam_medik_page.dart';
import 'package:simrs_mata/ui/login_page/login_page.dart';
import 'package:simrs_mata/ui/main_page/main_page.dart';
import 'package:simrs_mata/ui/rekam_medik_page/cre_user_rm_page.dart';
import 'package:simrs_mata/ui/rekam_medik_page/upd_user_rm_page.dart';
import 'package:simrs_mata/ui/rekam_medik_page/viw_user_rm_page.dart';
import 'package:simrs_mata/ui/splash_page/splash_page.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String loginPage = '/login';
  static const String splashPage = '/splash';
  static const String mainPage = '/mainPage';
  static const String creUserRm = '/cre-user-rm';
  static const String updUserRm = '/upd-user-rm';
  static const String viwUserRm = '/viw-user-rm';
  static const String creDataUserRm = '/cre-data-user-rm';
  static const String idxDataUserRm = '/idx-data-user-rm';
  static const String setting = '/setting';

  static final routes = <String, WidgetBuilder>{
    loginPage: (BuildContext context) => LoginPage(),
    splashPage: (BuildContext context) {
      final _userSignedIn = Provider.of<User>(context) != null;
      return _userSignedIn ? SplashPage() : LoginPage();
    },
    mainPage: (BuildContext context) {
      final _userSignedIn = Provider.of<User>(context) != null;
      return _userSignedIn ? MainPage() : LoginPage();
    },
    creUserRm: (BuildContext context) {
      final _userSignedIn = Provider.of<User>(context) != null;
      return _userSignedIn ? CreUserRmPage() : LoginPage();
    },
    updUserRm: (BuildContext context) {
      final _userSignedIn = Provider.of<User>(context) != null;
      return _userSignedIn ? UpdUserRmPage() : LoginPage();
    },
    viwUserRm: (BuildContext context) {
      final _userSignedIn = Provider.of<User>(context) != null;
      return _userSignedIn ? ViwUserRmPage() : LoginPage();
    },
    creDataUserRm: (BuildContext context) {
      final _userSignedIn = Provider.of<User>(context) != null;
      return _userSignedIn ? CreDataUserRmPage() : LoginPage();
    },
    idxDataUserRm: (BuildContext context) {
      final _userSignedIn = Provider.of<User>(context) != null;
      return _userSignedIn ? IdxDataUserRekamMedikPage() : LoginPage();
    },
    // setting: (BuildContext context) {
    //   final _userSignedIn = Provider.of<User>(context) != null;
    //   return _userSignedIn ? SettingsPage() : LoginPage();
    // },
  };
}
