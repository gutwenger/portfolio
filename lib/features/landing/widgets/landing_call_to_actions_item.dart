import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class LandingCallToActionsItem extends StatefulWidget {
  const LandingCallToActionsItem({Key? key, required this.label, required this.route}) : super(key: key);

  final String label;
  final String route;

  @override
  _LandingCallToActionsItemState createState() => _LandingCallToActionsItemState();
}

class _LandingCallToActionsItemState extends State<LandingCallToActionsItem> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _scale = 1.2;
        });
      },
      onExit: (_) {
        setState(() {
          _scale = 1.0;
        });
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            context.beamToNamed(widget.route);
          },
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
