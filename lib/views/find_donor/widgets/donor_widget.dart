import 'package:donneursang/core/common/models/user.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/core/common/models/request_donation.dart';
import 'package:donneursang/core/providers/providers.dart';
import 'package:donneursang/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../create_request/controller/request_controller.dart';

class DonorWidget extends ConsumerStatefulWidget {
  final UserModel userModel;
  const DonorWidget({
    super.key,
    required this.userModel,
  });

  @override
  ConsumerState<DonorWidget> createState() => _DonorWidgetState();
}

bool isLoading = false;

class _DonorWidgetState extends ConsumerState<DonorWidget> {
  final pref = container.read(sharedPreferencesProvider);
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.userModel.avatarPath != null
                  ? Image.network(Supabase.instance.client.storage
                      .from('usersImages')
                      .getPublicUrl(widget.userModel.avatarPath!))
                  : Image.asset("assets/images/emptyprofil.png"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.userModel.firstNname} ${widget.userModel.lastNname}",
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
                        "${widget.userModel.cordonate.locality} ${widget.userModel.cordonate.country}",
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
          const Gap(16),
          GestureDetector(
            onTap: () async {
              try {
                isLoading = true;
                setState(() {});
                ref
                    .read(requestControllerProvider)
                    .createRequestDonation(context,
                        requestDonation: RequestDonation(
                          usersDonor: widget.userModel,
                          usersDonorConfirm: false,
                          usersRequestDonation:
                              UserModel.fromJson(pref.getString("user")!),
                          createAt: DateTime.now(),
                          paymentStatus: false,
                          cancel: false,
                          rejet: false,
                        ));
              } catch (e) {
                e;
              } finally {
                isLoading = false;
                setState(() {});
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: isLoading
                    ? const Text("Send Request")
                    : const SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
