import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beamer/beamer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/locations.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final BeamerDelegate _beamerDelegate = BeamerDelegate(
    initialPath: '/',
    locationBuilder: BeamerLocationBuilder(beamLocations: [PortfolioLocation()]),
    setBrowserTabTitle: false,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      routerDelegate: _beamerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: _beamerDelegate),
      // Text theme
      theme: ThemeData(textTheme: GoogleFonts.dmSerifTextTextTheme(Theme.of(context).textTheme)),
    );
  }
}
