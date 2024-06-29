import 'package:flutter/material.dart';
import 'package:goread/screens/login_screen.dart';
import 'package:goread/services/strings.dart';
import 'package:goread/utils/colors.dart';
import 'package:goread/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textIndex = currentIndex != 2 ? "Next" : "Get Started";
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                  debugPrint("$currentIndex");
                });
              },
              controller: _pageController,
              children: const [
                BuildOnboard(
                  image: "assets/images/image_1.png",
                  title: Letters.title_one,
                  body: Letters.body_one,
                ),
                BuildOnboard(
                  image: 'assets/images/image_2.png',
                  title: Letters.title_two,
                  body: Letters.body_two,
                ),
                BuildOnboard(
                  image: 'assets/images/image_3.png',
                  title: Letters.title_three,
                  body: Letters.body_three,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: _buildIndicators(),
              ),
              _makeButton(textIndex),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _makeButton(String text) {
    return GestureDetector(
      onTap: () {
        if (currentIndex != 2) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false);
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 54,
        width: 180,
        decoration: BoxDecoration(
          color: ColorsOwn.mainColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _indicators(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 10,
      width: isActive ? 30 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorsOwn.mainColor,
      ),
      curve: Curves.easeInCubic,
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicators(true));
      } else {
        indicators.add(_indicators(false));
      }
    }
    return indicators;
  }
}
