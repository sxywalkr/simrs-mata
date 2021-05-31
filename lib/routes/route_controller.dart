import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/ui/login_page/login_page.dart';
import 'package:simrs_mata/ui/main_page/main_page.dart';
import 'package:simrs_mata/ui/rekam_medik_page/cre_user_rm_page.dart';
import 'package:simrs_mata/ui/rekam_medik_page/upd_user_rm_page.dart';
import 'package:simrs_mata/ui/settings_page/settings_page.dart';
import 'package:simrs_mata/ui/splash_page/splash_page.dart';

import '../not_found_page.dart';

class RouteController extends StatelessWidget {
  final String settingsName;
  const RouteController({
    Key key,
    @required this.settingsName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userSignedIn = Provider.of<User>(context) != null;
    final notSignedInGoSettings = !userSignedIn && settingsName == '/settings';
    final signedInGoSettings = userSignedIn && settingsName == '/settings';

    if (userSignedIn && settingsName == '/') {
      return MainPage();
    } else if (!userSignedIn && settingsName == '/') {
      return LoginPage();
    } else if (settingsName == '/splash-page') {
      return SplashPage();
    } else if (settingsName == '/cre-user-rm') {
      return CreUserRmPage();
    } else if (settingsName == '/upd-user-rm') {
      return UpdUserRmPage(
          // document: null,
          );
    } else if (notSignedInGoSettings || settingsName == '/login') {
      return LoginPage();
    } else if (signedInGoSettings) {
      return SettingsPage();
    } else {
      return NotFoundPage();
    }
  }
}
