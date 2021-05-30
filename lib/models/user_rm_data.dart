import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserRmData {
  final String userRmUid;
  final String userRmNik;
  final String userRmNama;
  final String userRmTempatLahir;
  final String userRmTanggalLahir;
  final String userRmJenisKelamin;
  final String userRmAlamat;
  final String userRmAlamatRT;
  final String userRmAlamatRW;
  final String userRmAlamatKelurahan;
  final String userRmAlamatKecamatan;
  final String userRmAgama;
  final String userRmStatusNikah;
  final String userRmPekerjaan;
  final String userRmNomorRm;
  final DocumentReference documentReference;

  UserRmData({
    this.userRmUid,
    @required this.userRmNik,
    @required this.userRmNama,
    this.userRmTempatLahir,
    this.userRmTanggalLahir,
    this.userRmJenisKelamin,
    this.userRmAlamat,
    @required this.userRmNomorRm,
    this.userRmAlamatRT,
    this.userRmAlamatRW,
    this.userRmAlamatKelurahan,
    this.userRmAlamatKecamatan,
    this.userRmAgama,
    this.userRmStatusNikah,
    this.userRmPekerjaan,
    this.documentReference,
  });

  Map<String, dynamic> toMap() {
    return {
      'userRmUid': userRmUid,
      'userRmNik': userRmNik,
      'userRmNama': userRmNama,
      'userRmTempatLahir': userRmTempatLahir,
      'userRmTanggalLahir': userRmTanggalLahir,
      'userRmJenisKelamin': userRmJenisKelamin,
      'userRmAlamat': userRmAlamat,
      'userRmAlamatRT': userRmAlamatRT,
      'userRmAlamatRW': userRmAlamatRW,
      'userRmAlamatKelurahan': userRmAlamatKelurahan,
      'userRmAlamatKecamatan': userRmAlamatKecamatan,
      'userRmAgama': userRmAgama,
      'userRmStatusNikah': userRmStatusNikah,
      'userRmPekerjaan': userRmPekerjaan,
      'userRmNomorRm': userRmNomorRm,
      'documentReference': documentReference,
    };
  }

  factory UserRmData.fromMap(Map<String, dynamic> map) {
    return UserRmData(
      userRmUid: map['userRmUid'],
      userRmNik: map['userRmNik'],
      userRmNama: map['userRmNama'],
      userRmTempatLahir: map['userRmTempatLahir'],
      userRmTanggalLahir: map['userRmTanggalLahir'],
      userRmJenisKelamin: map['userRmJenisKelamin'],
      userRmAlamat: map['userRmAlamat'],
      userRmAlamatRT: map['userRmAlamatRT'],
      userRmAlamatRW: map['userRmAlamatRW'],
      userRmAlamatKelurahan: map['userRmAlamatKelurahan'],
      userRmAlamatKecamatan: map['userRmAlamatKecamatan'],
      userRmAgama: map['userRmAgama'],
      userRmStatusNikah: map['userRmStatusNikah'],
      userRmPekerjaan: map['userRmPekerjaan'],
      userRmNomorRm: map['userRmNomorRm'],
      documentReference: map['documentReference'],
    );
  }

  factory UserRmData.fromDocument(QueryDocumentSnapshot qDocSnapshot) {
    return UserRmData(
      userRmUid: qDocSnapshot.id,
      userRmNik: qDocSnapshot['userRmNik'],
      userRmNama: qDocSnapshot['userRmNama'],
      userRmTempatLahir: qDocSnapshot['userRmTempatLahir'],
      userRmTanggalLahir: qDocSnapshot['userRmTanggalLahir'],
      userRmJenisKelamin: qDocSnapshot['userRmJenisKelamin'],
      userRmAlamat: qDocSnapshot['userRmAlamat'],
      userRmAlamatRT: qDocSnapshot['userRmAlamatRT'],
      userRmAlamatRW: qDocSnapshot['userRmAlamatRW'],
      userRmAlamatKelurahan: qDocSnapshot['userRmAlamatKelurahan'],
      userRmAlamatKecamatan: qDocSnapshot['userRmAlamatKecamatan'],
      userRmAgama: qDocSnapshot['userRmAgama'],
      userRmStatusNikah: qDocSnapshot['userRmStatusNikah'],
      userRmPekerjaan: qDocSnapshot['userRmPekerjaan'],
      userRmNomorRm: qDocSnapshot['userRmNomorRm'],
      documentReference: qDocSnapshot.reference,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRmData.fromJson(String source) =>
      UserRmData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserRm(userRmUid: $userRmUid, userRmNik: $userRmNik, userRmNama: $userRmNama, userRmTempatLahir: $userRmTempatLahir, userRmTanggalLahir: $userRmTanggalLahir, userRmJenisKelamin: $userRmJenisKelamin, userRmAlamat: $userRmAlamat, userRmAlamatRT: $userRmAlamatRT, userRmAlamatRW: $userRmAlamatRW, userRmAlamatKelurahan: $userRmAlamatKelurahan, userRmAlamatKecamatan: $userRmAlamatKecamatan, userRmAgama: $userRmAgama, userRmStatusNikah: $userRmStatusNikah, userRmPekerjaan: $userRmPekerjaan, userRmNomorRm: $userRmNomorRm, documentReference: $documentReference,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRmData &&
        other.userRmUid == userRmUid &&
        other.userRmNik == userRmNik &&
        other.userRmNama == userRmNama &&
        other.userRmTempatLahir == userRmTempatLahir &&
        other.userRmTanggalLahir == userRmTanggalLahir &&
        other.userRmJenisKelamin == userRmJenisKelamin &&
        other.userRmAlamat == userRmAlamat &&
        other.userRmAlamatRT == userRmAlamatRT &&
        other.userRmAlamatRW == userRmAlamatRW &&
        other.userRmAlamatKelurahan == userRmAlamatKelurahan &&
        other.userRmAlamatKecamatan == userRmAlamatKecamatan &&
        other.userRmAgama == userRmAgama &&
        other.userRmStatusNikah == userRmStatusNikah &&
        other.userRmPekerjaan == userRmPekerjaan &&
        other.userRmNomorRm == userRmNomorRm &&
        other.documentReference == documentReference;
  }

  @override
  int get hashCode {
    return userRmUid.hashCode ^
        userRmNik.hashCode ^
        userRmNama.hashCode ^
        userRmTempatLahir.hashCode ^
        userRmTanggalLahir.hashCode ^
        userRmJenisKelamin.hashCode ^
        userRmAlamat.hashCode ^
        userRmAlamatRT.hashCode ^
        userRmAlamatRW.hashCode ^
        userRmAlamatKelurahan.hashCode ^
        userRmAlamatKecamatan.hashCode ^
        userRmAgama.hashCode ^
        userRmStatusNikah.hashCode ^
        userRmPekerjaan.hashCode ^
        userRmNomorRm.hashCode ^
        documentReference.hashCode;
  }
}
