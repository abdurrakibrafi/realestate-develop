import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/onboarding_model.dart';

class OnboardingController {
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  final List<OnBoarding> onboardingData = [
    OnBoarding(
      image: "assets/images/onboarding/Onboarding3.png",
      title: "Simplify Your Property Management",
    ),
    OnBoarding(
      image: "assets/images/onboarding/Onboarding4.png",
      title: "Effortless Hosting Maximum Returns",
    ),
    OnBoarding(
      image: "assets/images/onboarding/Onboarding5.png",
      title: "Your All-in-One Rental Solution",
    ),
  ];
}
