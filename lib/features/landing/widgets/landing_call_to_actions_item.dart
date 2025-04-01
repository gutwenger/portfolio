import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class LandingCallToActionsItem extends StatelessWidget {
  const LandingCallToActionsItem({Key? key, required this.label, required this.route}) : super(key: key);

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.beamToNamed(route);
      },
      child: Text(label, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
