import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simrs_mata/models/data_user_rm_model.dart';
import 'package:simrs_mata/models/user_rm_model.dart';
import 'package:intl/intl.dart';

class CreDataUserRmPage extends StatefulWidget {
  @override
  _CreDataUserRmPageState createState() => _CreDataUserRmPageState();
}

class _CreDataUserRmPageState extends State<CreDataUserRmPage> {
  // TextEditingController _dataUserRmIdController = TextEditingController();
  // TextEditingController _dataUserRmTanggalPeriksaController =
  // TextEditingController();
  // TextEditingController _dataUserRmNote1Controller = TextEditingController();
  // TextEditingController _dataUserRmHasil1Controller = TextEditingController();
  // TextEditingController _dataUserRmHasil2Controller = TextEditingController();
  DateTime _date1 = DateTime.now();
  UserRmModel routes;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    routes = ModalRoute.of(context).settings.arguments;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: _date1,
        firstDate: DateTime(2021),
        lastDate: DateTime(2022));
    if (pickedDate != null && pickedDate != _date1)
      setState(() {
        _date1 = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    final _dataUserRmCollection =
        FirebaseFirestore.instance.collection('dataUserRm');
    final _formKey = GlobalKey<FormState>();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data User Rekam Medik'),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
        child: SizedBox(
          width: width * 0.6,
          child: Material(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Tambah Data User Rekam Medik',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(DateFormat.yMMMMEEEEd().format(_date1)),
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: TextButton(
                              child: Text('Pilih Tanggal Periksa'),
                              onPressed: () => _selectDate(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _dataUserRmCollection
                                  .add(
                                    DataUserRmModel(
                                      userRmUid: routes.userRmUid,
                                      dataUserRmTanggalPeriksa:
                                          _date1.toIso8601String(),
                                    ).toMap(),
                                  )
                                  .then((value) => _dataUserRmCollection
                                      .doc(value.id)
                                      .update({'dataUserRmId': value.id}));
                              Navigator.of(context).pop();
                              _formKey.currentState.reset();
                            }
                          },
                          child: Text(
                            'Simpan',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
