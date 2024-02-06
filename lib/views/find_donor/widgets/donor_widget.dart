import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/data/donor_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonorWidget extends StatelessWidget {
  final Donor donor;
  const DonorWidget({Key? key, required this.donor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 100,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(donor.startimage),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    donor.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 18),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        donor.icon,
                        size: 24,
                        color: kPrimaryColor,
                      ),
                      Text(
                        donor.subtitle,
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
                donor.image,
                width: 30,
              ),
            ],
          ),
    );
  }
}
