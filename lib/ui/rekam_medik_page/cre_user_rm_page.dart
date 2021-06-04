import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/models/user_rm_data.dart';

class CreUserRmPage extends StatefulWidget {
  @override
  _CreUserRmPageState createState() => _CreUserRmPageState();
}

class _CreUserRmPageState extends State<CreUserRmPage> {
  TextEditingController _userRmNikController = TextEditingController();
  TextEditingController _userRmNamaController = TextEditingController();
  TextEditingController _userRmTempatLahirController = TextEditingController();
  TextEditingController _userRmTanggalLahirController = TextEditingController();
  TextEditingController _jenisKelaminController =
      TextEditingController(text: 'Pilih Jenis Kelamin');
  TextEditingController _userRmAlamatController = TextEditingController();
  TextEditingController _userRmNomorRmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _userRmCollection = Provider.of<CollectionReference>(context);
    final _formKey = GlobalKey<FormState>();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah User RM'),
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tambah User RM',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? 'Masukkan NIK' : null;
                        },
                        controller: _userRmNikController,
                        decoration: InputDecoration(
                          labelText: 'NIK',
                          hintText: 'Nomor Induk Kependudukan',
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? 'Masukkan Nama' : null;
                        },
                        controller: _userRmNamaController,
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          hintText: 'Nama',
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? 'Masukkan Tempat Lahir' : null;
                        },
                        controller: _userRmTempatLahirController,
                        decoration: InputDecoration(
                          labelText: 'Tempat Lahir',
                          hintText: 'Tempat lahir',
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty
                              ? 'Masukkan Tanggal Lahir'
                              : null;
                        },
                        controller: _userRmTanggalLahirController,
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir (Tahun/Bulan/Tanggal)',
                          hintText: 'YYYY/MM/DD',
                        ),
                      ),
                      SizedBox(height: 8),
                      DropdownButton<String>(
                        value: _jenisKelaminController.text,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        // style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          // color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            _jenisKelaminController =
                                TextEditingController(text: newValue);
                            // _jenisKelamin = newValue;
                          });
                        },
                        items: <String>[
                          'Pilih Jenis Kelamin',
                          'Laki-laki',
                          'Perempuan'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty
                              ? 'Masukkan Alamat Lengkap'
                              : null;
                        },
                        controller: _userRmAlamatController,
                        decoration: InputDecoration(
                          labelText: 'Alamat Lengkap',
                          hintText: 'Jl. alamat sesuai KTP',
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? 'Masukkan Nomor RM' : null;
                        },
                        controller: _userRmNomorRmController,
                        decoration: InputDecoration(
                          labelText: 'Nomor RM',
                          hintText: '00000000',
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _userRmCollection.add(
                                UserRmData(
                                  userRmNik: _userRmNikController.text,
                                  userRmNama: _userRmNamaController.text,
                                  userRmNomorRm: _userRmNomorRmController.text,
                                  userRmAlamat: _userRmAlamatController.text,
                                  userRmTempatLahir:
                                      _userRmTempatLahirController.text,
                                  userRmTanggalLahir:
                                      _userRmTanggalLahirController.text,
                                  userRmJenisKelamin:
                                      _jenisKelaminController.text,
                                ).toMap(),
                              );
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

  Future showErrorDialog(BuildContext context, error) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Oh Snap!'),
          content: Text(error.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Dismiss'),
            )
          ],
        );
      },
    );
  }
}

bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
