import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/bounce_typewriter_text.dart';

class LandingTitle extends StatefulWidget {
  const LandingTitle({Key? key}) : super(key: key);

  @override
  _LandingTitleState createState() => _LandingTitleState();
}

class _LandingTitleState extends State<LandingTitle> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimationI;
  late final Animation<double> _scaleAnimationAM;
  late final Animation<double> _fadeAnimationI;
  late final Animation<double> _fadeAnimationAM;
  late final Animation<double> _fadeAnimationLAM;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _scaleAnimationI = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.33, curve: Curves.easeOut)));

    _scaleAnimationAM = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.34, 0.66, curve: Curves.easeOut)));

    _fadeAnimationI = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.33, curve: Curves.easeIn)));

    _fadeAnimationAM = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.34, 0.66, curve: Curves.easeIn)));

    _fadeAnimationLAM = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.67, 1.0, curve: Curves.easeIn)));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(
      context,
    ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w900, fontSize: 100, height: 0.8);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeTransition(
          opacity: _fadeAnimationI,
          child: ScaleTransition(scale: _scaleAnimationI, child: Text('I', style: titleStyle)),
        ),
        FadeTransition(
          opacity: _fadeAnimationAM,
          child: ScaleTransition(scale: _scaleAnimationAM, child: Text('AM', style: titleStyle)),
        ),
        FadeTransition(opacity: _fadeAnimationLAM, child: BounceTypewriterText(text: 'LAM', style: titleStyle)),
      ],
    );
  }
}
