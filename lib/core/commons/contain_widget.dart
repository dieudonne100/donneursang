import 'package:donneursang/core/common/models/user.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:gap/gap.dart';

class ContainWidget extends StatelessWidget {
  final UserModel userModel;
  const ContainWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(userModel.createdAt.toString());

    int minute = dateTime.minute;
    final fifteenAgo = DateTime.now().subtract(Duration(minutes: minute));
    return Container(
      padding: const EdgeInsets.all(12),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${userModel.firstNname} ${userModel.lastNname}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 24,
                        color: kPrimaryColor,
                      ),
                      Text(
                        "${userModel.cordonate.locality} ${userModel.cordonate.country}",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/images/b+.svg',
                width: 30,
              ),
            ],
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timeago.format(fifteenAgo),
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontSize: 12),
              ),
              const Text(
                "Donate",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
