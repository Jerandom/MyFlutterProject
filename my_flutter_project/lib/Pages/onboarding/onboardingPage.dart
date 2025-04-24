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
                                    Text("TITLE", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),

                                    const SizedBox(height: 20),

                                    // Subtitle
                                    Text("SUBTITLE", style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                                ],
                            ),
                        ),
                    ],
                ),

                // Skip button
                Positioned(
                    top: 20, 
                    right: 20, 
                    child: TextButton(onPressed: (){}, child: const Text("Skip"))
                ),

                // Dot navigation SmoothPageIndicator
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: SmoothPageIndicator(
                        controller: PageController(), 
                        count: 3
                        effect: ExpandingDotsEffect(activeDotColor: Theme.of(context)., dotHeight: 6)
                    ),
                ),

                // Circular Button
                Positioned(
                    right: 20,
                    bottom: 20,
                    style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: Theme.of(context).)
                    child: ElevatedButton(
                        onPressed: (){},
                        child: Icon(ICON HERE)
                    ),
                ),
            ],
        ),
    );
  }
}
