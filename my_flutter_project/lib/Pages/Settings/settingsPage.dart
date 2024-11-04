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
		return Scaffold(
			backgroundColor: Theme.of(context).colorScheme.surface,
			appBar: AppBar(
				elevation: 0,
				backgroundColor: Colors.transparent,
				foregroundColor: Theme.of(context).colorScheme.inversePrimary,
			),
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
						//dark mode
						Text(
							"Dark Mode",
							style: TextStyle(
								fontWeight: FontWeight.bold,
								color: Theme.of(context).colorScheme.inversePrimary,
							),
						),

						// switch toggle
						CupertinoSwitch(
							value: true,
							onChanged: (bool value) {

							},
						),
					],
				),
			),
		);
	}
}