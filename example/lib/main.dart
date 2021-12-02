import 'package:flutter/material.dart';
import 'package:prefs_viewer/prefs_viewer.dart';

void main() async {
  SharedPreferences.setMockInitialValues({
    'key': 'value',
    'name': 'ahmed',
    'age': '25',
    'is_admin': true,
    'is_active': false,
    'is_married': false,
    'DOB': DateTime.now(),
    'fav_color': Colors.red,
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PrefsViewer.open(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Queen Shared Preferences View \n👁',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ),
      appBar: AppBar(
        title: const Text('👑 Queen Themes'),
      ),
    );
  }
}
