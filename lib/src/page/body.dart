import 'package:flutter/material.dart';
import 'package:prefs_viewer/prefs_viewer.dart';
import 'package:prefs_viewer/src/page/edit_dialog.dart';

class BodyWidget extends StatefulWidget {
  final SharedPreferences prefs;
  const BodyWidget({Key? key, required this.prefs}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    final keys = widget.prefs.getKeys().toList();
    return ListView.builder(
      itemCount: keys.length,
      itemBuilder: (context, index) {
        final key = keys[index];
        final value = widget.prefs.get(key);
        return Card(
          child: ListTile(
            leading: Text(value.runtimeType.toString()),
            title: Text(key),
            subtitle: Text(value!.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    final result = await showDialog<String>(
                      context: context,
                      builder: (context) => EditDialog(
                        keyName: key,
                        value: value.toString(),
                      ),
                    );
                    if (result == null) return;
                    if (value.runtimeType == String) {
                      widget.prefs.setString(key, result);
                    } else if (value.runtimeType == bool) {
                      widget.prefs.setBool(key, result == 'true');
                    } else if (value.runtimeType == int) {
                      widget.prefs.setInt(key, int.parse(result));
                    } else if (value.runtimeType == double) {
                      widget.prefs.setDouble(key, double.parse(result));
                    }
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    widget.prefs.remove(key);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
