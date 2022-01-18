import 'package:flutter/material.dart';
import 'package:mission_app/core/consts/app_consts.dart';

import 'progress_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _animation =
        AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topCenter)
            .animate(_controller);

    _controller.animateTo(0.75);

    _controller.addListener(() {
      if(_controller.value == 0.75){
        Future.delayed(const Duration(seconds: 2)).then((value) {
          _controller.forward();
        });
      }
    });


    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _controller.value == 1) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProgressScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: _controller.value * screenHeight - 40,
                child: const Text(AppConsts.name, textAlign: TextAlign.center),
              ),
            ],
          );
        },
      ),
    );
  }
}
