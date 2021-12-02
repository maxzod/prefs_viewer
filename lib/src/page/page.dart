import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'body.dart';

class PrefsHomePage extends StatelessWidget {
  const PrefsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Content 👁'),
      ),
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BodyWidget(prefs: snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
