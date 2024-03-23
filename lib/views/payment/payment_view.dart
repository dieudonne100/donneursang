import 'package:donneursang/core/commons/custom_button.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/payment/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Payment",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const Gap(32),
          Image.asset(
            "",
            height: 150,
            width: 150,
          ),
          const Gap(16),
          PaymentItem(
            image: "",
            payMethode: "MTN",
            phone: "675150288",
            onChanged: (p0) {},
          ),
          const Gap(16),
          PaymentItem(
            image: "",
            payMethode: "Orange",
            phone: "675150288",
            onChanged: (p0) {},
          ),
          PaymentItem(
            image: "",
            payMethode: "Paypal",
            phone: "675150288",
            onChanged: (p0) {},
          ),
          const Gap(32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              color: kPrimaryColor,
              isFullWidth: true,
              text: "Payment",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
