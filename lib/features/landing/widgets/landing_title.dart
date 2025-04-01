import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/bounce_typewriter_text.dart';

class LandingTitle extends StatelessWidget {
  const LandingTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(
      context,
    ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w900, fontSize: 100, height: 0.8);

    return Column(
      children: [
        Text('I', style: titleStyle),
        Text('AM', style: titleStyle),
        BounceTypewriterText(
          text: 'LAM',
          style: titleStyle,
          duration: const Duration(milliseconds: 3000), // 1.5s for typing and 1.5s for deleting
        ),
      ],
    );
  }
}
