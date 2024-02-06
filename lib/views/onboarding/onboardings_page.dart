import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/onboarding/onboarding3_page.dart';
import 'package:donneursang/views/onboarding/widgets/dot_indicator.dart';
import 'package:donneursang/views/onboarding/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';

import '../../models/onboarding_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: items.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (context, index) => OnboardingWidget(
              image: items[index].image,
              title: items[index].title,
              text: items[index].texte,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ...List.generate(
                    items.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (_pageIndex == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingPage3()));
                  } else if (_pageIndex < 2) {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
