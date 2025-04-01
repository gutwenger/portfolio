import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkillsScreen extends ConsumerStatefulWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends ConsumerState<SkillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[Text('Skills')]),
      ),
    );
  }
}
