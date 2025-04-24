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
                        Padding(
                            padding: const EdgeInserts.all(12),
                            child: Column(
                                children: [
                                    Image(
                                        width: 20,
                                        height: 20,
                                        image: AssetImage("IMAGE STRING"),
                                    ),

                                    // Title
                                    Text("TITLE", style: Theme.of(context)., textAlign: TextAlign.center),

                                    const SizedBox(height: 20),

                                    // Subtitle
                                    Text("SUBTITLE", style: Theme.of(context)., textAlign: TextAlign.center),
                                ],
                            ),
                        ),
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
