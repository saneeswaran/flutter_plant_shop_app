import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_shop_ui/data/plants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_page.dart';

class OngoingPage extends StatelessWidget {
  const OngoingPage({super.key});
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final pageController = PageController(initialPage: 0);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const LoginPage()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.60,
              width: width * 1,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: introPlantImages.length,
                  itemBuilder: (context, index) {
                    return onGoingPageItems[index];
                  }),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: introPlantImages.length,
              effect: const WormEffect(
                  activeDotColor: Colors.green,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 20),
            ),
            const Text(
              "Enjoy your life with",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Dream Plants",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  if (currentIndex < 2) {
                    currentIndex++;
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    Navigator.of(context).pushReplacement(PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const LoginPage()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.green),
                label: const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 70,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
