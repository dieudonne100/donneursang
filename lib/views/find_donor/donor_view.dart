import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/find_donor/widgets/donor_widget.dart';
import 'package:donneursang/views/home/controller/home_controller.dart';
import 'package:donneursang/views/search/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class DonorView extends ConsumerStatefulWidget {
  const DonorView({super.key});

  @override
  ConsumerState<DonorView> createState() => _DonorViewState();
}

class _DonorViewState extends ConsumerState<DonorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Find Donors',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Poppins"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBarWidget(),
            ref.watch(getIsdoneActivateProvider).when(
              data: (data) {
                return data.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return DonorWidget(
                              userModel: data[index],
                            );
                          },
                          separatorBuilder: (_, __) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                        ),
                      )
                    : Center(
                        child:
                            SvgPicture.asset('assets/icons/Empty_cuate.svg'));
              },
              error: (error, stackTrace) {
                return const SizedBox();
              },
              loading: () {
                return const Center(
                  child: SizedBox(
                      height: 32,
                      width: 32,
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
