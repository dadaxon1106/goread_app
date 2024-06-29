import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goread/screens/onboarding/onboarding_screen.dart';

class Utils {
  static void init(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          (route) => true);
    });
  }
}
