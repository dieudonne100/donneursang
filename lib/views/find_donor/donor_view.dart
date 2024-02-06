import 'package:donneursang/models/donor_model.dart';
import 'package:donneursang/views/find_donor/widgets/donor_widget.dart';
import 'package:donneursang/views/search/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class DonorView extends StatefulWidget {
  const DonorView({super.key});

  @override
  State<DonorView> createState() => _DonorViewState();
}

class _DonorViewState extends State<DonorView> {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: donorItems.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DonorWidget(donor: donorItems[index]);
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 12,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
