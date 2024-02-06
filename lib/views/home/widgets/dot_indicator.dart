import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int length;
  final int selectedIndex;
  final Color dotSelectedColor;
  final Color dotUnselectedColor;

  const DotIndicator(
      {Key? key,
      required this.length,
      required this.selectedIndex,
      required this.dotSelectedColor,
      required this.dotUnselectedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          length,
          (index) => Padding(
                padding: EdgeInsets.only(right: index == length - 1 ? 0 : 8),
                child: Container(
                  // duration: const Duration(milliseconds: 800),
                  height: selectedIndex == index ? 14 : 10,
                  width: selectedIndex == index ? 14 : 10,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: selectedIndex == index
                          ? Border.all(width: 1, color: dotSelectedColor)
                          : null,
                      color: selectedIndex == index
                          ? Colors.transparent
                          : dotUnselectedColor,
                      shape: BoxShape.circle),
                  child: selectedIndex == index
                      ? Container(
                          decoration: BoxDecoration(
                              color: dotSelectedColor, shape: BoxShape.circle),
                        )
                      : null,
                ),
              )),
    );
  }
}
