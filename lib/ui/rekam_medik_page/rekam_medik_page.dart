import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/models/user_rm_data.dart';
import 'package:simrs_mata/routes/routes.dart';
import 'package:simrs_mata/ui/rekam_medik_page/upd_user_rm_page.dart';

class RekamMedikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _docs = Provider.of<List<UserRmData>>(context);
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          flex: 1,
          // width: width,
          // color: Colors.blueGrey.shade50,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'User Rekam Medik',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 40,
                width: 200,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.creUserRm),
                  child: Text(
                    'Tambah Data',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 350,
                height: 200,
                child: Column(
                  children: [
                    for (var doc in _docs)
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                        title: Text(doc.userRmNama),
                        key: Key(doc.userRmUid),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                return Navigator.of(context).pushNamed(
                                    Routes.updUserRm,
                                    arguments: doc);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                return Navigator.of(context).pushNamed(
                                    Routes.updUserRm,
                                    arguments: doc);
                              },
                              icon: Icon(Icons.delete),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
