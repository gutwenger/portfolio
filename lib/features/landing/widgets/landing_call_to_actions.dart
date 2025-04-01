import 'package:flutter/material.dart';
import 'package:my_portfolio/features/landing/widgets/landing_call_to_actions_item.dart';

class LandingCallToActions extends StatelessWidget {
  const LandingCallToActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: <Widget>[
        LandingCallToActionsItem(label: 'Projects', route: '/projects'),
        LandingCallToActionsItem(label: 'Experience', route: '/experience'),
        LandingCallToActionsItem(label: 'Connect', route: '/contact'),
      ],
    );
  }
}
