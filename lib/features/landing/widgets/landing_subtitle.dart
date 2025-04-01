import 'dart:async';
import 'package:flutter/material.dart';

class LandingSubTitle extends StatefulWidget {
  LandingSubTitle({Key? key}) : super(key: key);

  @override
  _LandingSubTitleState createState() => _LandingSubTitleState();
}

class _LandingSubTitleState extends State<LandingSubTitle> {
  final List<String> _stacks = ['Web', 'Mobile', 'Flutter'];
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _stacks.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_stacks[_currentIndex], style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        Text(" developer", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
