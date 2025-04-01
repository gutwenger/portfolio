import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EducationScreen extends ConsumerStatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends ConsumerState<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Education')),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Text('Education')])),
    );
  }
}
