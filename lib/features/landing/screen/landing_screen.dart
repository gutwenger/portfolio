import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to My Portfolio!'),
            TextButton(onPressed: () => context.beamToNamed('/projects'), child: const Text('Projects')),
            TextButton(onPressed: () => context.beamToNamed('/experience'), child: const Text('Experience')),
            TextButton(onPressed: () => context.beamToNamed('/education'), child: const Text('Education')),
            TextButton(onPressed: () => context.beamToNamed('/skills'), child: const Text('Skills')),
            TextButton(onPressed: () => context.beamToNamed('/contact'), child: const Text('Contact')),
          ],
        ),
      ),
    );
  }
}
