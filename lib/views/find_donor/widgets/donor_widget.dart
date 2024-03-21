import 'package:donneursang/core/common/models/user.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DonorWidget extends StatelessWidget {
  final UserModel userModel;
  const DonorWidget({super.key, required this.userModel});

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
          userModel.avatarPath != null
              ? Image.network(Supabase.instance.client.storage
                  .from('usersImages')
                  .getPublicUrl(userModel.avatarPath!))
              :
          Image.asset("assets/images/emptyprofil.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
            "assets/images/b-.svg",
            width: 30,
          ),
        ],
      ),
    );
  }
}
