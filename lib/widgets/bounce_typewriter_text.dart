import 'package:flutter/material.dart';

class BounceTypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  // Duration for typing the full text.
  final Duration duration;
  final Duration pauseDuration; // pause after typing is complete

  const BounceTypewriterText({
    Key? key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 3000), // total typing duration
    this.pauseDuration = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  _BounceTypewriterTextState createState() => _BounceTypewriterTextState();
}

class _BounceTypewriterTextState extends State<BounceTypewriterText> {
  int _letterCount = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    final fullLength = widget.text.length;
    // Calculate delay time per letter for the typing phase.
    final typingDelay = Duration(milliseconds: widget.duration.inMilliseconds ~/ fullLength);

    // Typing phase: go from 0 to fullLength.
    for (int i = 0; i <= fullLength; i++) {
      if (!mounted) break;
      setState(() {
        _letterCount = i;
      });
      await Future.delayed(typingDelay);
    }

    // Optionally hold the full text for a bit after typing out.
    await Future.delayed(widget.pauseDuration);

    // Animation completed (no deletion).
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text.substring(0, _letterCount), style: widget.style);
  }
}
