import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/data/contain_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ContainWidget extends StatelessWidget {
  final Contain contain;
  const ContainWidget({Key? key, required this.contain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    contain.title1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      Icon(
                        contain.icon,
                        size: 24,
                        color: kPrimaryColor,
                      ),
                      Text(
                        contain.title2,
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
                contain.temps,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontSize: 12),
              ),
              Text(
                contain.titre,
                textAlign: TextAlign.start,
                style: const TextStyle(
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
