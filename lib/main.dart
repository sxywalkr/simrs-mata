import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/models/link_data.dart';
import 'package:simrs_mata/models/user_rm_data.dart';
import 'package:simrs_mata/not_found_page.dart';
import 'package:simrs_mata/routes/route_controller.dart';
import 'package:simrs_mata/routes/routes.dart';
import 'package:simrs_mata/ui/login_page/login_page.dart';
import 'package:simrs_mata/ui/main_page/main_page.dart';
import 'package:simrs_mata/ui/splash_page/splash_page.dart';

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

    final userRmCollection = FirebaseFirestore.instance.collection('userRm');
    final userRmStream =
        userRmCollection.orderBy('userRmNama').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserRmData.fromDocument(doc);
      }).toList();
    });

    return MultiProvider(
      providers: [
        StreamProvider<User>(
          initialData: null,
          create: (context) => FirebaseAuth.instance.authStateChanges(),
        ),
        Provider<CollectionReference>(
          create: (context) => linksCollection,
        ),
        Provider<CollectionReference>(
          create: (context) => userRmCollection,
        ),
        StreamProvider<List<LinkData>>(
          initialData: [],
          create: (context) => userLinkDataStream,
        ),
        StreamProvider<List<UserRmData>>(
          initialData: [],
          create: (context) => userRmStream,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SIMRS MATA',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.routes,
        home: SplashPage(),
        // initialRoute: '/',
        // onGenerateRoute: (settings) {
        //   return MaterialPageRoute(
        //     builder: (context) {
        //       return RouteController(settingsName: settings.name);
        //     },
        //   );
        // },
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
