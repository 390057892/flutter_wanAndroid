import 'package:flutter/material.dart';
import 'package:flutter_wan_android/res/import_class.dart';
import 'package:flutter_wan_android/views/widgets/progress.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationsControl.of(context).get(Ids.about)),
      ),
      body: ProgressView(),
    );
  }
}
