import 'package:donneursang/models/contain_model.dart';
import 'package:flutter/material.dart';

import '../../core/commons/contain_widget.dart';

class DonationView extends StatefulWidget {
  const DonationView({super.key});

  @override
  State<DonationView> createState() => _DonationViewState();
}

class _DonationViewState extends State<DonationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Donation Request',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Poppins",
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
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
            ),
          ),
        ));
  }
}
