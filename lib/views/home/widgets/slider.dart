import 'package:carousel_slider/carousel_slider.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/data/items_class.dart';
import 'package:donneursang/models/item_model.dart';
import 'package:donneursang/views/home/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';

class HomeHeaderMain extends StatefulWidget {
  const HomeHeaderMain({Key? key}) : super(key: key);

  @override
  State<HomeHeaderMain> createState() => _HomeHeaderMainState();
}

class _HomeHeaderMainState extends State<HomeHeaderMain> {
  int activeIndex = 0;
  final List<Widget> imageSliders = homeItems
      .map((item) => HomeHeaderImage(
            items: item,
          ))
      .toList();

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
            GestureDetector(
              onTap: () {},
              child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  autoPlay: true,
                  aspectRatio: 2.5,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
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
  const HomeHeaderImage({Key? key, required this.items}) : super(key: key);

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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
