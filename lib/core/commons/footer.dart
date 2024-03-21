import 'package:donneursang/views/create_request/request_view.dart';
import 'package:donneursang/views/donation_request/donation_view.dart';
import 'package:donneursang/views/home/home_view.dart';
import 'package:donneursang/views/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../constants/themes.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  dynamic selected;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.home_outlined,
            ),
            selectedIcon: const Icon(Icons.home_rounded),
            selectedColor: kPrimaryColor,
            title: const Text(
              "Accueil",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                letterSpacing: 0.1,
                color: kPrimaryColor,
              ),
            ),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.search,
            ),
            selectedIcon: const Icon(Icons.wallet_rounded),
            selectedColor: kPrimaryColor,
            title: const Text(
              'Search',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                letterSpacing: 0.1,
                color: kPrimaryColor,
              ),
            ),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.monitor_heart_outlined,
            ),
            selectedIcon: const Icon(
              Icons.bookmark,
            ),
            selectedColor: kPrimaryColor,
            title: const Text(
              ".",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                letterSpacing: 0.1,
                color: kPrimaryColor,
              ),
            ),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              selectedColor: kPrimaryColor,
              title: const Text(
                'Profile',
                style: TextStyle(fontFamily: "Poppins"),
              )),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const QRViewState()));
        },
        backgroundColor: kPrimaryColor,
        child: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RequestPage()));
          },
          icon: const Icon(
            Icons.bloodtype_outlined,
            color: kWhiteColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            HomeView(),
            SearchView(),
            DonationView(),
            HomeView(),
          ],
        ),
      ),
    );
  }
}
