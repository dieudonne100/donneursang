// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:donneursang/core/common/models/cordonate.dart';

class UserModel {
  final int? id;
  final String phone;
  final String lastNname;
  final String firstNname;
  final String email;
  final String pass;
  final String bloodGroup;
  final DateTime birthDate;
  final DateTime? createdAt;
  final String gender;
  final bool isDonor;
  final String? avatarPath;
  final Cordonate cordonate;
  UserModel({
    this.id,
    required this.phone,
    required this.lastNname,
    required this.firstNname,
    required this.email,
    required this.pass,
    required this.bloodGroup,
    required this.birthDate,
    this.createdAt,
    required this.gender,
    required this.isDonor,
    this.avatarPath,
    required this.cordonate,
  });

  UserModel copyWith({
    int? id,
    String? phone,
    String? lastNname,
    String? firstNname,
    String? email,
    String? pass,
    String? bloodGroup,
    DateTime? birthDate,
    DateTime? createdAt,
    String? gender,
    bool? isDonor,
    String? avatarPath,
    Cordonate? cordonate,
  }) {
    return UserModel(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      lastNname: lastNname ?? this.lastNname,
      firstNname: firstNname ?? this.firstNname,
      email: email ?? this.email,
      pass: pass ?? this.pass,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      birthDate: birthDate ?? this.birthDate,
      createdAt: createdAt ?? this.createdAt,
      gender: gender ?? this.gender,
      isDonor: isDonor ?? this.isDonor,
      avatarPath: avatarPath ?? this.avatarPath,
      cordonate: cordonate ?? this.cordonate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'lastNname': lastNname,
      'firstNname': firstNname,
      'email': email,
      'pass': pass,
      'bloodGroup': bloodGroup,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'gender': gender,
      'isDonor': isDonor,
      'avatarPath': avatarPath,
      'cordonate': cordonate.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      phone: map['phone'] as String,
      lastNname: map['lastName'] as String,
      firstNname: map['firstName'] as String,
      email: map['email'] as String,
      pass: map['pass'] as String,
      bloodGroup: map['bloodGroup'] as String,
      birthDate: DateTime.parse(map['birthdate']),
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      gender: map['gender'] as String,
      isDonor: map['isdonor'] as bool,
      avatarPath: map['avatar'] != null ? map['avatar'] as String : null,
      cordonate: Cordonate.fromMap(map['cordonate'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, phone: $phone, lastNname: $lastNname, firstNname: $firstNname, email: $email, pass: $pass, bloodGroup: $bloodGroup, birthDate: $birthDate, createdAt: $createdAt, gender: $gender, isDonor: $isDonor, avatarPath: $avatarPath, cordonate: $cordonate)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phone == phone &&
        other.lastNname == lastNname &&
        other.firstNname == firstNname &&
        other.email == email &&
        other.pass == pass &&
        other.bloodGroup == bloodGroup &&
        other.birthDate == birthDate &&
        other.createdAt == createdAt &&
        other.gender == gender &&
        other.isDonor == isDonor &&
        other.avatarPath == avatarPath &&
        other.cordonate == cordonate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        phone.hashCode ^
        lastNname.hashCode ^
        firstNname.hashCode ^
        email.hashCode ^
        pass.hashCode ^
        bloodGroup.hashCode ^
        birthDate.hashCode ^
        createdAt.hashCode ^
        gender.hashCode ^
        isDonor.hashCode ^
        avatarPath.hashCode ^
        cordonate.hashCode;
  }
}
