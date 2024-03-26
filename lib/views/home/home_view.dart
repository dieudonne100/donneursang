import 'package:donneursang/core/common/models/user.dart';
import 'package:donneursang/core/commons/contain_widget.dart';
import 'package:donneursang/views/campaign_details/add_campaigm.dart';
import 'package:donneursang/views/create_request/controller/request_controller.dart';
import 'package:donneursang/views/find_donor/donor_view.dart';
import 'package:donneursang/views/home/widgets/drawer.dart';
import 'package:donneursang/views/home/widgets/modules.dart';
import 'package:donneursang/views/home/widgets/slider.dart';
import 'package:donneursang/views/report/reportview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  List<UserModel> donorUser = [];
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          actions: [
            SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 24,
            ),
            const Gap(16)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeaderMain(),
              const Gap(16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                module(
                  icon: "assets/icons/find.svg",
                  title: "Find Donors",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DonorView()));
                  },
                ),
                module(
                  icon: "assets/icons/bloodperf.svg",
                  title: "Donates",
                  ontap: () {},
                ),
                module(
                  icon: "assets/icons/blood-bag.svg",
                  title: "Order Bloods",
                  ontap: () {},
                ),
              ]),
              const Gap(16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                module(
                  icon: "assets/icons/doctor.svg",
                  title: "Assistant",
                  ontap: () {},
                ),
                module(
                  icon: "assets/icons/file-medical.svg",
                  title: "Report",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportView()));
                  },
                ),
                module(
                  icon: "assets/icons/announce.svg",
                  title: "Campaign",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCampaigm()));
                  },
                ),
              ]),
              const Gap(30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Donation Request",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 24),
                ),
              ),
              const Gap(30),
              ref.watch(getRequestDonationProvider).when(
                data: (data) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ContainWidget(userModel: data[index].usersDonor);
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return const SizedBox();
                },
                loading: () {
                  return const SizedBox();
                },
              )
            ],
          ),
        ));
  }
}
