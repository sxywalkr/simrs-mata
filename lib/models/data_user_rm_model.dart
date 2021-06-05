import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataUserRmModel {
  final String userRmUid;
  final String dataUserRmId;
  final String dataUserRmTanggalPeriksa;
  final String dataUserRmNote1;
  final String dataUserRmHasil1;
  final String dataUserRmHasil2;
  final DocumentReference dataUserRmDocumentReference;

  DataUserRmModel({
    @required this.userRmUid,
    this.dataUserRmId,
    @required this.dataUserRmTanggalPeriksa,
    this.dataUserRmNote1,
    this.dataUserRmHasil1,
    this.dataUserRmHasil2,
    this.dataUserRmDocumentReference,
  });

  DataUserRmModel copyWith({
    String userRmUid,
    String dataUserRmId,
    String dataUserRmTanggalPeriksa,
    String dataUserRmNote1,
    String dataUserRmHasil1,
    String dataUserRmHasil2,
    DocumentReference dataUserRmDocumentReference,
  }) {
    return DataUserRmModel(
      userRmUid: userRmUid ?? this.userRmUid,
      dataUserRmId: dataUserRmId ?? this.dataUserRmId,
      dataUserRmTanggalPeriksa:
          dataUserRmTanggalPeriksa ?? this.dataUserRmTanggalPeriksa,
      dataUserRmNote1: dataUserRmNote1 ?? this.dataUserRmNote1,
      dataUserRmHasil1: dataUserRmHasil1 ?? this.dataUserRmHasil1,
      dataUserRmHasil2: dataUserRmHasil2 ?? this.dataUserRmHasil2,
      dataUserRmDocumentReference:
          dataUserRmDocumentReference ?? this.dataUserRmDocumentReference,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userRmUid': userRmUid,
      'dataUserRmId': dataUserRmId,
      'dataUserRmTanggalPeriksa': dataUserRmTanggalPeriksa,
      'dataUserRmNote1': dataUserRmNote1,
      'dataUserRmHasil1': dataUserRmHasil1,
      'dataUserRmHasil2': dataUserRmHasil2,
      'dataUserRmDocumentReference': dataUserRmDocumentReference,
    };
  }

  factory DataUserRmModel.fromMap(Map<String, dynamic> map) {
    return DataUserRmModel(
      userRmUid: map['userRmUid'],
      dataUserRmId: map['dataUserRmId'],
      dataUserRmTanggalPeriksa: map['dataUserRmTanggalPeriksa'],
      dataUserRmNote1: map['dataUserRmNote1'],
      dataUserRmHasil1: map['dataUserRmHasil1'],
      dataUserRmHasil2: map['dataUserRmHasil2'],
      dataUserRmDocumentReference: map['dataUserRmDocumentReference'],
    );
  }

  factory DataUserRmModel.fromDocument(QueryDocumentSnapshot map) {
    return DataUserRmModel(
      userRmUid: map.id,
      dataUserRmId: map['dataUserRmId'],
      dataUserRmTanggalPeriksa: map['dataUserRmTanggalPeriksa'],
      dataUserRmNote1: map['dataUserRmNote1'],
      dataUserRmHasil1: map['dataUserRmHasil1'],
      dataUserRmHasil2: map['dataUserRmHasil2'],
      dataUserRmDocumentReference: map.reference,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataUserRmModel.fromJson(String source) =>
      DataUserRmModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataUserRmModel(userRmUid: $userRmUid, dataUserRmId: $dataUserRmId, dataUserRmTanggalPeriksa: $dataUserRmTanggalPeriksa, dataUserRmNote1: $dataUserRmNote1, dataUserRmHasil1: $dataUserRmHasil1, dataUserRmHasil2: $dataUserRmHasil2, dataUserRmDocumentReference: $dataUserRmDocumentReference)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataUserRmModel &&
        other.userRmUid == userRmUid &&
        other.dataUserRmId == dataUserRmId &&
        other.dataUserRmTanggalPeriksa == dataUserRmTanggalPeriksa &&
        other.dataUserRmNote1 == dataUserRmNote1 &&
        other.dataUserRmHasil1 == dataUserRmHasil1 &&
        other.dataUserRmHasil2 == dataUserRmHasil2 &&
        other.dataUserRmDocumentReference == dataUserRmDocumentReference;
  }

  @override
  int get hashCode {
    return userRmUid.hashCode ^
        dataUserRmId.hashCode ^
        dataUserRmTanggalPeriksa.hashCode ^
        dataUserRmNote1.hashCode ^
        dataUserRmHasil1.hashCode ^
        dataUserRmHasil2.hashCode ^
        dataUserRmDocumentReference.hashCode;
  }
}
