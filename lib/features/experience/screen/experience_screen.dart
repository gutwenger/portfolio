import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExperienceScreen extends ConsumerStatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends ConsumerState<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Experience')),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Text('Experience')])),
    );
  }
}
