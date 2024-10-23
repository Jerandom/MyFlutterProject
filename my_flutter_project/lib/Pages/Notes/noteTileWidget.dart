import 'package:flutter/material.dart';

class NoteTileWidget extends StatelessWidget {
    final String text;
    final VoidCallback? onEditPressed;
    final VoidCallback? onDeletePressed;

    const NoteTileWidget({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
});

@override
Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
    child: ListTile(
        title: Text(text),
        trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                IconButton(
                    onPressed: onEditPressed,
                    icon: const Icon(Icons.edit),
                ),
                IconButton(
                    onPressed: onDeletePressed,
                    icon: const Icon(Icons.delete),
                ),
            ],
        ),
    ),
);
}