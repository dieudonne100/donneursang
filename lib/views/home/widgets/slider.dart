import 'package:carousel_slider/carousel_slider.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/data/items_class.dart';
import 'package:donneursang/views/home/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';

class HomeHeaderMain extends StatefulWidget {
  const HomeHeaderMain({super.key});

  @override
  State<HomeHeaderMain> createState() => _HomeHeaderMainState();
}

class _HomeHeaderMainState extends State<HomeHeaderMain> {
  int activeIndex = 0;
  final List<String> homeItems = [
    "assets/blood_research_amico.svg",
    "assets/Blood_test_pana.svg",
    "assets/Blood_donation_amico.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: homeItems.length,
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 8),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(homeItems[index],
                      height: 100, width: double.infinity, fit: BoxFit.cover),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Center(
                child: Container(
                  child: buildIndicator(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  buildIndicator() => DotIndicator(
        selectedIndex: activeIndex,
        length: homeItems.length,
        dotSelectedColor: kPrimaryColor,
        dotUnselectedColor: const Color(0xffEEEEEE),
      );
}

class HomeHeaderImage extends StatefulWidget {
  final Items items;
  const HomeHeaderImage({super.key, required this.items});

  @override
  State<HomeHeaderImage> createState() => _HomeHeaderImageState();
}

class _HomeHeaderImageState extends State<HomeHeaderImage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Image.asset(
        widget.items.image,
        width: double.infinity,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
