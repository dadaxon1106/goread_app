import 'package:flutter/material.dart';
import 'package:goread/services/splash_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final _animation;
  @override
  void initState() {
    Utils.init(context);
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    super.initState();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            "assets/images/logo.png",
            height: 40,
          ),
        ),
      ),
    );
  }
}
