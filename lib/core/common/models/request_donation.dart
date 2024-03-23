import 'dart:convert';

import 'package:donneursang/core/common/models/user.dart';

class RequestDonation {
  final UserModel usersDonor;
  final UserModel usersRequestDonation;
  final DateTime createAt;
  final bool usersDonorConfirm;
  final bool paymentStatus;
  final bool cancel;
  final bool rejet;
  RequestDonation({
    required this.usersDonor,
    required this.usersRequestDonation,
    required this.createAt,
    required this.usersDonorConfirm,
    required this.paymentStatus,
    required this.cancel,
    required this.rejet,
  });

  RequestDonation copyWith({
    UserModel? usersDonor,
    UserModel? usersRequestDonation,
    DateTime? createAt,
    bool? usersDonorConfirm,
    bool? paymentStatus,
    bool? cancel,
    bool? rejet,
  }) {
    return RequestDonation(
      usersDonor: usersDonor ?? this.usersDonor,
      usersRequestDonation: usersRequestDonation ?? this.usersRequestDonation,
      createAt: createAt ?? this.createAt,
      usersDonorConfirm: usersDonorConfirm ?? this.usersDonorConfirm,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      cancel: cancel ?? this.cancel,
      rejet: rejet ?? this.rejet,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'usersDonor': usersDonor.toMap()});
    result.addAll({'usersRequestDonation': usersRequestDonation.toMap()});
    result.addAll({'createAt': createAt.millisecondsSinceEpoch});
    result.addAll({'usersDonorConfirm': usersDonorConfirm});
    result.addAll({'paymentStatus': paymentStatus});
    result.addAll({'cancel': cancel});
    result.addAll({'rejet': rejet});

    return result;
  }

  factory RequestDonation.fromMap(Map<String, dynamic> map) {
    return RequestDonation(
      usersDonor: UserModel.fromMap(map['usersDonor']),
      usersRequestDonation: UserModel.fromMap(map['usersRequestDonation']),
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt']),
      usersDonorConfirm: map['usersDonorConfirm'] ?? false,
      paymentStatus: map['paymentStatus'] ?? false,
      cancel: map['cancel'] ?? false,
      rejet: map['rejet'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestDonation.fromJson(String source) =>
      RequestDonation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RequestDonation(usersDonor: $usersDonor, usersRequestDonation: $usersRequestDonation, createAt: $createAt, usersDonorConfirm: $usersDonorConfirm, paymentStatus: $paymentStatus, cancel: $cancel, rejet: $rejet)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RequestDonation &&
        other.usersDonor == usersDonor &&
        other.usersRequestDonation == usersRequestDonation &&
        other.createAt == createAt &&
        other.usersDonorConfirm == usersDonorConfirm &&
        other.paymentStatus == paymentStatus &&
        other.cancel == cancel &&
        other.rejet == rejet;
  }

  @override
  int get hashCode {
    return usersDonor.hashCode ^
        usersRequestDonation.hashCode ^
        createAt.hashCode ^
        usersDonorConfirm.hashCode ^
        paymentStatus.hashCode ^
        cancel.hashCode ^
        rejet.hashCode;
  }
}
