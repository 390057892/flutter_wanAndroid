import 'package:flutter/material.dart';
import 'package:flutter_wan_android/res/import_class.dart';
import 'package:flutter_wan_android/views/widgets/progress.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationsControl.of(context).get(Ids.todo)),
      ),
      body: Progress(),
    );
  }
}
