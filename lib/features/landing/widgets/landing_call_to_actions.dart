import 'package:flutter/material.dart';
import 'package:my_portfolio/features/landing/widgets/landing_call_to_actions_item.dart';

class LandingCallToActions extends StatefulWidget {
  const LandingCallToActions({Key? key}) : super(key: key);

  @override
  _LandingCallToActionsState createState() => _LandingCallToActionsState();
}

class _LandingCallToActionsState extends State<LandingCallToActions> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<Offset>> _slideAnimations;
  final List<Map<String, String>> _items = [
    {'label': 'Projects', 'route': '/projects'},
    {'label': 'Experience', 'route': '/experience'},
    {'label': 'Connect', 'route': '/contact'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _slideAnimations = List.generate(_items.length, (int index) {
      double start = index * 0.2;
      double end = start + 0.5;
      return Tween<Offset>(
        begin: Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: _controller, curve: Interval(start, end, curve: Curves.easeOut)));
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(_items.length, (index) {
        return SlideTransition(
          position: _slideAnimations[index],
          child: Padding(
            padding: EdgeInsets.only(right: index < _items.length - 1 ? 28.0 : 0),
            child: LandingCallToActionsItem(label: _items[index]['label']!, route: _items[index]['route']!),
          ),
        );
      }),
    );
  }
}
