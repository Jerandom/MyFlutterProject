import 'package:flutter/material.dart';

class NoteTileWidget extends StatelessWidget {
  final String title;
  final String createdOn;
  final String updatedOn;
  final bool isDone;
  final ValueChanged<bool?>? onCheckboxChanged;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;


  const NoteTileWidget({
    super.key,
    required this.title,
    required this.createdOn,
    required this.updatedOn,
    required this.isDone,
    required this.onCheckboxChanged,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Created on: $createdOn",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Updated on: $updatedOn",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: isDone,
                  onChanged: onCheckboxChanged,
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: onEditPressed,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onDeletePressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
