import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                width: 20,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context))
                ),
                child: Row(
                    children: [
                        const Icon(Iconsax.search_normal, color: Theme.of(context)),
                        const SizedBox(width: 20),
                        Text('Search', style: Theme.of(context).textTheme.bodySmall),
                    ],
                ),
            ),
        ),
    ),
  }
}