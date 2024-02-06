import 'package:flutter/material.dart';

import '../../../core/constants/themes.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 40 : 10,
      decoration:  BoxDecoration(
        color: isActive ? kPrimaryColor:const Color.fromRGBO(224, 224, 224, 1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
