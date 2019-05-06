import 'package:flutter/material.dart';

class _Page{
  final String labelId;

  _Page(this.labelId);
}

final List<_Page> _Pages=[

];


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
       body: Center(
        child: Text('hello'),
       ),
    );
  }
}
