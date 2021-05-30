import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simrs_mata/ui/login_page/login_page.dart';
import 'package:simrs_mata/ui/main_page/main_page.dart';
import 'package:simrs_mata/models/link_data.dart';
import 'package:simrs_mata/not_found_page.dart';
import 'package:simrs_mata/ui/settings_page/settings_page.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // FirebaseFirestore.instance.settings = Settings(
  //   host: 'localhost:8080',
  //   sslEnabled: false,
  //   persistenceEnabled: false,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final linksCollection = FirebaseFirestore.instance.collection('links');
    final userLinkDataStream =
        linksCollection.orderBy('position').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LinkData.fromDocument(doc);
      }).toList();
    });

    return MultiProvider(
      providers: [
        StreamProvider<User>(
          create: (context) => FirebaseAuth.instance.authStateChanges(),
        ),
        Provider<CollectionReference>(
          create: (context) => linksCollection,
        ),
        StreamProvider<List<LinkData>>(
          create: (context) => userLinkDataStream,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SIMRS MATA',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return RouteController(settingsName: settings.name);
            },
          );
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return NotFoundPage();
            },
          );
        },
      ),
    );
  }
}

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

    if (settingsName == '/') {
      // return LinksLandingPage();
      return MainPage();
    } else if (notSignedInGoSettings || settingsName == '/login') {
      return LoginPage();
    } else if (signedInGoSettings) {
      return SettingsPage();
    } else {
      return NotFoundPage();
    }
  }
}
