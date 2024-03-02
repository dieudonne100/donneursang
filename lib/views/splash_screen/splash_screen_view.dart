import 'package:donneursang/views/splash_screen/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/constants/themes.dart';

class SplashscreenView extends ConsumerStatefulWidget {
  const SplashscreenView({super.key});

  @override
  ConsumerState<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends ConsumerState<SplashscreenView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacityTween = Tween<double>(begin: 0.0, end: 2.0).animate(_controller);

    _controller.forward();
    Future.delayed(const Duration(seconds: 5), () async {
      await ref.read(splashControllerProvider).getPositionAfterLoad(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          FadeTransition(
            opacity: _opacityTween,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logoblanc.png',
                    height: 116,
                  ),
                  const Gap(36),
                  const Text(
                    'Dare To Donate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w800),
                  ),
                  const Gap(136),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/fond.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
