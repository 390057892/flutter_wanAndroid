import 'package:flutter/material.dart';
import 'package:flutter_wan_android/res/import_class.dart';
import 'package:flutter_wan_android/views/widgets/progress.dart';

class CollectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocalizationsControl.of(context).get(Ids.collect)),
        ),
        body: Progress());
  }
}
