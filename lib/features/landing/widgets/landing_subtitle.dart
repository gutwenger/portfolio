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
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
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
        SizedBox(
          width: 150,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (child, animation) {
              final offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation);
              return SlideTransition(
                position: offsetAnimation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: Text(
              _stacks[_currentIndex],
              key: ValueKey<String>(_stacks[_currentIndex]),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Text(" developer", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
