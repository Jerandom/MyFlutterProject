import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySettingsPage extends ConsumerStatefulWidget {
	const MySettingsPage({super.key});

	@override
	ConsumerState<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends ConsumerState<MySettingsPage> {
	@override
	Widget build(BuildContext context) {
		final themeState = ref.watch(themeProvider);
		final isDarkMode = themeState.themeMode == ThemeMode.dark;

		return Scaffold(
			backgroundColor: Theme.of(context).colorScheme.surface,
			body: Container(
				decoration: BoxDecoration(
					color: Theme.of(context).colorScheme.primary,
					borderRadius: BorderRadius.circular(12),
				),
				padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
				margin: EdgeInsets.only(left:25, right: 25, top: 10),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
						Text(
							"Toggle Theme",
							style: TextStyle(
								fontWeight: FontWeight.bold,
								color: Theme.of(context).colorScheme.inversePrimary,
							),
						),

						// switch toggle
						CupertinoSwitch(
							value: isDarkMode,
							onChanged: (bool value) {
								ref.read(themeProvider.notifier).toggleTheme();
							},
						),
					],
				),
			),
		);
	}
}