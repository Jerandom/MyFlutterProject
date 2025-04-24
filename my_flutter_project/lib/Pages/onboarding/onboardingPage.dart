import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyOnboardingPage extends ConsumerWidget {
  const MyOnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingProvider);

    return Scaffold(
        body: Stack(
            children: [
                // Horizontal scrollable pages
                PageView(
                    children: [

                    ],
                ),

                // Skip button

                // Dot navigation SmoothPageIndicator

                // Circular Button
            ],
        ),
    );
  }
}
