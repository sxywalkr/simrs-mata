import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppUserModel {
  final String appUserUid;
  final String appUserNama;
  final String appUserEmail;
  final String appUserRole;
  final String appUserFcmId;
  final String appUserLastLogin;
  final DocumentReference appUserDocumentReference;
  AppUserModel({
    @required this.appUserUid,
    @required this.appUserNama,
    @required this.appUserEmail,
    @required this.appUserRole,
    this.appUserFcmId,
    this.appUserLastLogin,
    this.appUserDocumentReference,
  });

  AppUserModel copyWith({
    String appUserUid,
    String appUserNama,
    String appUserEmail,
    String appUserRole,
    String appUserFcmId,
    String appUserLastLogin,
    DocumentReference appUserDocumentReference,
  }) {
    return AppUserModel(
      appUserUid: appUserUid ?? this.appUserUid,
      appUserNama: appUserNama ?? this.appUserNama,
      appUserEmail: appUserEmail ?? this.appUserEmail,
      appUserRole: appUserRole ?? this.appUserRole,
      appUserFcmId: appUserFcmId ?? this.appUserFcmId,
      appUserLastLogin: appUserLastLogin ?? this.appUserLastLogin,
      appUserDocumentReference:
          appUserDocumentReference ?? this.appUserDocumentReference,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appUserUid': appUserUid,
      'appUserNama': appUserNama,
      'appUserEmail': appUserEmail,
      'appUserRole': appUserRole,
      'appUserFcmId': appUserFcmId,
      'appUserLastLogin': appUserLastLogin,
      'appUserDocumentReference': appUserDocumentReference,
    };
  }

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      appUserUid: map['appUserUid'],
      appUserNama: map['appUserNama'],
      appUserEmail: map['appUserEmail'],
      appUserRole: map['appUserRole'],
      appUserFcmId: map['appUserFcmId'],
      appUserLastLogin: map['appUserLastLogin'],
      appUserDocumentReference: map['appUserDocumentReference'],
    );
  }

  factory AppUserModel.fromDocument(QueryDocumentSnapshot map) {
    return AppUserModel(
      appUserUid: map.id,
      appUserNama: map['appUserNama'],
      appUserEmail: map['appUserEmail'],
      appUserRole: map['appUserRole'],
      appUserFcmId: map['appUserFcmId'],
      appUserLastLogin: map['appUserLastLogin'],
      appUserDocumentReference: map.reference,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUserModel.fromJson(String source) =>
      AppUserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUserModel(appUserUid: $appUserUid, appUserNama: $appUserNama, appUserEmail: $appUserEmail, appUserRole: $appUserRole, appUserFcmId: $appUserFcmId, appUserLastLogin: $appUserLastLogin, appUserDocumentReference: $appUserDocumentReference)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUserModel &&
        other.appUserUid == appUserUid &&
        other.appUserNama == appUserNama &&
        other.appUserEmail == appUserEmail &&
        other.appUserRole == appUserRole &&
        other.appUserFcmId == appUserFcmId &&
        other.appUserLastLogin == appUserLastLogin &&
        other.appUserDocumentReference == appUserDocumentReference;
  }

  @override
  int get hashCode {
    return appUserUid.hashCode ^
        appUserNama.hashCode ^
        appUserEmail.hashCode ^
        appUserRole.hashCode ^
        appUserFcmId.hashCode ^
        appUserLastLogin.hashCode ^
        appUserDocumentReference.hashCode;
  }
}
