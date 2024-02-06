import 'package:donneursang/views/report/widget/modules_report.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constants/themes.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Report',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Poppins"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(10),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 24,
                color: kPrimaryColor,
              ),
              Text(
                "Reseach Center",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    fontFamily: "Poppins"),
              ),
            ],
          ),
          const Text(
            "Dhaka Medical College, Dhaka.",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w300,
                fontSize: 15,
                fontFamily: "Poppins"),
          ),
          const Gap(50),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Image.asset(
              'assets/images/fillblood.png',
              height: 200,
            ),
          ),
          const Gap(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              modulereport(title: "6 mmol/L", subtitle: "Glucose"),
              modulereport(title: "6 mmol/L", subtitle: "Glucose"),
              modulereport(title: "6 mmol/L", subtitle: "Glucose"),
            ],
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              modulereport(title: "6 mmol/L", subtitle: "Glucose"),
              modulereport(title: "6 mmol/L", subtitle: "Glucose"),
              modulereport(title: "6 mmol/L", subtitle: "Glucose"),
            ],
          ),
         
        ],
      ),
    );
  }
}
