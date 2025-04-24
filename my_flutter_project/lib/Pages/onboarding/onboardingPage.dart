import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyOnboardingPage extends ConsumerWidget {
  const MyOnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingProvider);

    final PageController pageController = PageController();

    final List<Map<String, dynamic>> onboardingPages = [
      {
        "image": "assets/image1.png",
        "title": "Welcome",
        "subtitle": "Let's get started!"
      },
      {
        "image": "assets/image2.png",
        "title": "Discover",
        "subtitle": "Find what you need easily."
      },
      {
        "image": "assets/image3.png",
        "title": "Enjoy",
        "subtitle": "Have a great experience."
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable pages
          PageView(
            controller: pageController,
            children: onboardingPages.map((items) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 150,
                      height: 150,
                      image: AssetImage(items["image"]),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      items["title"],
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      items["subtitle"],
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          // Skip button
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                // your skip logic here
              },
              child: const Text("Skip"),
            ),
          ),

          // Dot navigation
          Positioned(
            bottom: 80,
            left: 20,
            child: SmoothPageIndicator(
              controller: pageController,
              count: onboardingPages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),

          // Circular next button
          Positioned(
            bottom: 60,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {
                // next page logic here
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
