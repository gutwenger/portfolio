import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/landing/widgets/landing_call_to_actions.dart';
import 'package:my_portfolio/features/landing/widgets/landing_subtitle.dart';
import 'package:my_portfolio/features/landing/widgets/landing_title.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Title
            const LandingTitle(),
            LandingSubTitle(),
            const LandingCallToActions(),
          ],
        ),
      ),
    );
  }
}
