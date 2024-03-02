// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String uid;
  final String profileImageUrl;
  final bool active;
  final int lastSeen;
  final String phoneNumber;
  final String email;
  final String pass;
  final String fname;
  final String city;
  final bool statedonne;
  final String bloodGroup;
  final String gender;
  UserModel({
    required this.uid,
    required this.profileImageUrl,
    required this.active,
    required this.lastSeen,
    required this.phoneNumber,
    required this.email,
    required this.pass,
    required this.fname,
    required this.city,
    required this.statedonne,
    required this.bloodGroup,
    required this.gender,
  });

  UserModel copyWith({
    String? uid,
    String? profileImageUrl,
    bool? active,
    int? lastSeen,
    String? phoneNumber,
    String? email,
    String? pass,
    String? fname,
    String? city,
    bool? statedonne,
    String? bloodGroup,
    String? gender,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      active: active ?? this.active,
      lastSeen: lastSeen ?? this.lastSeen,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      pass: pass ?? this.pass,
      fname: fname ?? this.fname,
      city: city ?? this.city,
      statedonne: statedonne ?? this.statedonne,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'profileImageUrl': profileImageUrl,
      'active': active,
      'lastSeen': lastSeen,
      'phoneNumber': phoneNumber,
      'email': email,
      'pass': pass,
      'fname': fname,
      'city': city,
      'statedonne': statedonne,
      'bloodGroup': bloodGroup,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      profileImageUrl: map['profileImageUrl'] as String,
      active: map['active'] as bool,
      lastSeen: map['lastSeen'] as int,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      pass: map['pass'] as String,
      fname: map['fname'] as String,
      city: map['city'] as String,
      statedonne: map['statedonne'] as bool,
      bloodGroup: map['bloodGroup'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, profileImageUrl: $profileImageUrl, active: $active, lastSeen: $lastSeen, phoneNumber: $phoneNumber, email: $email, pass: $pass, fname: $fname, city: $city, statedonne: $statedonne, bloodGroup: $bloodGroup, gender: $gender)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.profileImageUrl == profileImageUrl &&
      other.active == active &&
      other.lastSeen == lastSeen &&
      other.phoneNumber == phoneNumber &&
      other.email == email &&
      other.pass == pass &&
      other.fname == fname &&
      other.city == city &&
      other.statedonne == statedonne &&
      other.bloodGroup == bloodGroup &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      profileImageUrl.hashCode ^
      active.hashCode ^
      lastSeen.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      pass.hashCode ^
      fname.hashCode ^
      city.hashCode ^
      statedonne.hashCode ^
      bloodGroup.hashCode ^
      gender.hashCode;
  }
}
