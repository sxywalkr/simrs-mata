import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/models/user_rm_data.dart';
import 'package:simrs_mata/routes/routes.dart';

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
                width: width * 0.6,
                // height: 200,
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
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    final _userRmCollection =
                                        Provider.of<CollectionReference>(
                                            context);
                                    return AlertDialog(
                                      title: Text(
                                          'Anda ingin menghapus ${doc.userRmNama} ?'),
                                      content: Text(
                                          'Data tidak dapat dikembalikan lagi.'),
                                      actions: [
                                        TextButton(
                                          child: Text(
                                            'Hapus',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.redAccent),
                                          onPressed: () {
                                            _userRmCollection
                                                .doc(doc.userRmUid)
                                                .delete();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                                onPressed: () {
                                  return Navigator.of(context)
                                      .pushReplacementNamed(Routes.viwUserRm,
                                          arguments: doc);
                                },
                                icon: Icon(Icons.chevron_right)),
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
