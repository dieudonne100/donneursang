// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cordonate {
  final double lat;
  final double lng;
  final String country;
  final String countryCode;
  final String locality;
  Cordonate({
    required this.lat,
    required this.lng,
    required this.country,
    required this.countryCode,
    required this.locality,
  });

  Cordonate copyWith({
    double? lat,
    double? lng,
    String? country,
    String? countryCode,
    String? locality,
  }) {
    return Cordonate(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      locality: locality ?? this.locality,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
      'country': country,
      'countryCode': countryCode,
      'locality': locality,
    };
  }

  factory Cordonate.fromMap(Map<String, dynamic> map) {
    return Cordonate(
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      country: map['country'] as String,
      countryCode: map['countryCode'] as String,
      locality: map['locality'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cordonate.fromJson(String source) =>
      Cordonate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cordonate(lat: $lat, lng: $lng, country: $country, countryCode: $countryCode, locality: $locality)';
  }

  @override
  bool operator ==(covariant Cordonate other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.lng == lng &&
        other.country == country &&
        other.countryCode == countryCode &&
        other.locality == locality;
  }

  @override
  int get hashCode {
    return lat.hashCode ^
        lng.hashCode ^
        country.hashCode ^
        countryCode.hashCode ^
        locality.hashCode;
  }
}
