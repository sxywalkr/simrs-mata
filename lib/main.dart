import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/models/app_user_model.dart';
import 'package:simrs_mata/models/data_user_rm_model.dart';
import 'package:simrs_mata/models/link_data.dart';
import 'package:simrs_mata/models/user_rm_model.dart';
import 'package:simrs_mata/not_found_page.dart';
import 'package:simrs_mata/routes/routes.dart';
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
        return UserRmModel.fromDocument(doc);
      }).toList();
    });

    final dataUserRmCollection =
        FirebaseFirestore.instance.collection('dataUser');
    final dataUserRmStream =
        dataUserRmCollection.orderBy('dataUserRm').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DataUserRmModel.fromDocument(doc);
      }).toList();
    });

    String userUid;

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
        Provider<CollectionReference>(
          create: (context) => dataUserRmCollection,
        ),
        FutureProvider<String>(
          initialData: 'noUid',
          create: (context) => Future.value(userUid),
          // child: MyApp(),
        ),
        // ChangeNotifierProxyProvider0<>(
        //   create: (context) => AppUserModel(),
        // ),
        StreamProvider<List<LinkData>>(
          initialData: [],
          create: (context) => userLinkDataStream,
        ),
        StreamProvider<List<UserRmModel>>(
          initialData: [],
          create: (context) => userRmStream,
        ),
        StreamProvider<List<DataUserRmModel>>(
          initialData: [],
          create: (context) => dataUserRmStream,
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
