import 'dart:convert';

class Campaign {
  final String name;
  final String phoneNumber;
  final String image;
  final String bloodNeededDate;
  final String bloodGroup;
  final String location;
  Campaign({
    required this.name,
    required this.phoneNumber,
    required this.image,
    required this.bloodNeededDate,
    required this.bloodGroup,
    required this.location,
  });

  Campaign copyWith({
    String? name,
    String? phoneNumber,
    String? image,
    String? bloodNeededDate,
    String? bloodGroup,
    String? location,
  }) {
    return Campaign(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
      bloodNeededDate: bloodNeededDate ?? this.bloodNeededDate,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'image': image});
    result.addAll({'bloodNeededDate': bloodNeededDate});
    result.addAll({'bloodGroup': bloodGroup});
    result.addAll({'location': location});

    return result;
  }

  factory Campaign.fromMap(Map<String, dynamic> map) {
    return Campaign(
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      image: map['image'] ?? '',
      bloodNeededDate: map['bloodNeededDate'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      location: map['location'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Campaign.fromJson(String source) =>
      Campaign.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Campaign(name: $name, phoneNumber: $phoneNumber, image: $image, bloodNeededDate: $bloodNeededDate, bloodGroup: $bloodGroup, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Campaign &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.image == image &&
        other.bloodNeededDate == bloodNeededDate &&
        other.bloodGroup == bloodGroup &&
        other.location == location;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phoneNumber.hashCode ^
        image.hashCode ^
        bloodNeededDate.hashCode ^
        bloodGroup.hashCode ^
        location.hashCode;
  }
}
