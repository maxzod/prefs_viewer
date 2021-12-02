import 'package:flutter/material.dart';

class EditDialog extends StatelessWidget {
  final String keyName;
  final String value;

  const EditDialog({
    Key? key,
    required this.keyName,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              keyName,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Enter value',
              ),
              controller: controller,
            ),

            /// red button on click pop
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    Navigator.of(context).pop(controller.text);
                  },
                  label: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
