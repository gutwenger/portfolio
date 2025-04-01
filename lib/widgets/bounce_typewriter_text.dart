import 'package:flutter/material.dart';

class BounceTypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  // Duration for the full cycle: typing and then deleting.
  final Duration duration;
  final Duration pauseDuration; // pause between phases

  const BounceTypewriterText({
    Key? key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 3000), // total typing and deleting duration
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
    // Calculate delay time per letter for typing/deleting phases.
    // We assume half of the widget.duration for each phase.
    final typingDelay = Duration(milliseconds: (widget.duration.inMilliseconds ~/ 2) ~/ fullLength);
    while (mounted) {
      // Typing phase: go from 0 to fullLength.
      for (int i = 0; i <= fullLength; i++) {
        if (!mounted) break;
        setState(() {
          _letterCount = i;
        });
        await Future.delayed(typingDelay);
      }
      // Pause with full text visible.
      await Future.delayed(widget.pauseDuration);
      // Deleting phase: go from fullLength down to 0.
      for (int i = fullLength; i >= 0; i--) {
        if (!mounted) break;
        setState(() {
          _letterCount = i;
        });
        await Future.delayed(typingDelay);
      }
      // Pause with text completely deleted.
      await Future.delayed(widget.pauseDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text.substring(0, _letterCount), style: widget.style);
  }
}
