import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beamer/beamer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/locations.dart';

/// Preload the Google Font by laying out a dummy text.
Future<void> _preloadFonts() async {
  final textPainter = TextPainter(
    text: TextSpan(text: 'sample', style: GoogleFonts.dmSerifText(fontSize: 20)),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();
  // Optionally, wait a moment to ensure the font has fully loaded.
  await Future.delayed(Duration(milliseconds: 100));
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _preloadFonts();
  runApp(ProviderScope(child: AppLoader()));
}

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Display splash screen for 3 seconds; adjust duration as needed.
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()) : MyApp();
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the same background color as your app if needed.
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
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
      // Apply the Google Font theme.
      theme: ThemeData(textTheme: GoogleFonts.dmSerifTextTextTheme(Theme.of(context).textTheme)),
    );
  }
}
