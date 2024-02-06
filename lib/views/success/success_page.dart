// ignore_for_file: library_private_types_in_public_api

import 'package:donneursang/core/commons/footer.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomBar()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _bounce(_controller.value) * 20),
                    child: child,
                  );
                },
                child: Image.asset(
                  'assets/images/success.png',
                  height: 180,
                ),
              ),
              const Spacer(),
              const Text(
                'SUCCÈS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Dosis",
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                  "Inscription réussie ! Explorez notre application et débloquez un voyage excitant vers la réussite et la facilité d'utilisation.",
                  textAlign: TextAlign.center,
                  style: AppTheme.kSubTitle),
              const Spacer(),
              const CircularProgressIndicator(
                color: Colors.blue,
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  double _bounce(double value) {
    return math.sin(value * math.pi);
  }
}
