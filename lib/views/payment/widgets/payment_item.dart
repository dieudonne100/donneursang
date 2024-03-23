import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final String image;
  final String payMethode;
  final String phone;
  final void Function(String?)? onChanged;
  const PaymentItem(
      {super.key,
      required this.image,
      required this.payMethode,
      required this.phone,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(image),
          Column(
            children: [
              Text(
                payMethode,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                phone,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          Radio(value: "", groupValue: "", onChanged: onChanged)
        ],
      ),
    );
  }
}
