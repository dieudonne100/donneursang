// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
  String email;
  String pass;
  String fname;
  String phone;
  String city;
  String state;
  String? photoUrl;
  String? bloodGroup;
  String? gender;
  DateTime? dateOfBirth;
  bool? bloodDonor = false;
  Users({
    required this.email,
    required this.pass,
    required this.fname,
    required this.phone,
    required this.city,
    required this.state,
    this.photoUrl,
    this.bloodGroup,
    this.gender,
    this.dateOfBirth,
    this.bloodDonor,
  });


  Users copyWith({
    String? email,
    String? pass,
    String? fname,
    String? phone,
    String? city,
    String? state,
    String? photoUrl,
    String? bloodGroup,
    String? gender,
    DateTime? dateOfBirth,
    bool? bloodDonor,
  }) {
    return Users(
      email: email ?? this.email,
      pass: pass ?? this.pass,
      fname: fname ?? this.fname,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      state: state ?? this.state,
      photoUrl: photoUrl ?? this.photoUrl,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bloodDonor: bloodDonor ?? this.bloodDonor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'pass': pass,
      'fname': fname,
      'phone': phone,
      'city': city,
      'state': state,
      'photoUrl': photoUrl,
      'bloodGroup': bloodGroup,
      'gender': gender,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
      'bloodDonor': bloodDonor,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      email: map['email'] as String,
      pass: map['pass'] as String,
      fname: map['fname'] as String,
      phone: map['phone'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      bloodGroup: map['bloodGroup'] != null ? map['bloodGroup'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int) : null,
      bloodDonor: map['bloodDonor'] != null ? map['bloodDonor'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Users(email: $email, pass: $pass, fname: $fname, phone: $phone, city: $city, state: $state, photoUrl: $photoUrl, bloodGroup: $bloodGroup, gender: $gender, dateOfBirth: $dateOfBirth, bloodDonor: $bloodDonor)';
  }

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.pass == pass &&
      other.fname == fname &&
      other.phone == phone &&
      other.city == city &&
      other.state == state &&
      other.photoUrl == photoUrl &&
      other.bloodGroup == bloodGroup &&
      other.gender == gender &&
      other.dateOfBirth == dateOfBirth &&
      other.bloodDonor == bloodDonor;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      pass.hashCode ^
      fname.hashCode ^
      phone.hashCode ^
      city.hashCode ^
      state.hashCode ^
      photoUrl.hashCode ^
      bloodGroup.hashCode ^
      gender.hashCode ^
      dateOfBirth.hashCode ^
      bloodDonor.hashCode;
  }
}
