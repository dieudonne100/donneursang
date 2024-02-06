import 'package:donneursang/core/commons/contain_widget.dart';
import 'package:donneursang/models/contain_model.dart';
import 'package:donneursang/views/find_donor/donor_view.dart';
import 'package:donneursang/views/home/widgets/modules.dart';
import 'package:donneursang/views/home/widgets/slider.dart';
import 'package:donneursang/views/report/reportview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            size: 24,
          ),
          actions: [
            SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 24,
            ),
            const Gap(16)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeaderMain(),
                const Gap(16),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                        ontap: () {},
                      ),
                    ]),
                const Gap(30),
                const Text(
                  "Donation Request",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 24),
                ),
                const Gap(30),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: containItems.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ContainWidget(contain: containItems[index]);
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
