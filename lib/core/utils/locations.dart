import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/features/contact/screen/contact_screen.dart';
import 'package:my_portfolio/features/education/screen/education_screen.dart';
import 'package:my_portfolio/features/experience/screen/experience_screen.dart';
import 'package:my_portfolio/features/landing/screen/landing_screen.dart';
import 'package:my_portfolio/features/projects/screen/projects_screen.dart';
import 'package:my_portfolio/features/skills/screen/skills_screen.dart';
import '../utils/routes.dart';

class PortfolioLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => portfolioRoutes;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final uri = Uri.parse(state.uri.toString());

    return [
      if (uri.path == '/') const BeamPage(key: ValueKey('landing'), title: 'Landing', child: LandingScreen()),
      if (uri.path == '/projects')
        const BeamPage(key: ValueKey('Experience'), title: 'Experience', child: ProjectsScreen()),
      if (uri.path == '/experience')
        const BeamPage(key: ValueKey('experience'), title: 'Experience', child: ExperienceScreen()),
      if (uri.path == '/education')
        const BeamPage(key: ValueKey('education'), title: 'Education', child: EducationScreen()),
      if (uri.path == '/skills') const BeamPage(key: ValueKey('skills'), title: 'Skills', child: SkillsScreen()),
      if (uri.path == '/contact') const BeamPage(key: ValueKey('contact'), title: 'Contact', child: ContactScreen()),
    ];
  }
}
