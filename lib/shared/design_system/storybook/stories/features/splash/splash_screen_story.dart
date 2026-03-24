import 'package:storybook_flutter/storybook_flutter.dart';
import '../../../../../../features/splash/presentation/screens/splash_screen.dart';

final Story splashScreenStory = Story(
  name: 'Screens/Splash Screen',
  description: 'Splash screen com o degradê da identidade visual.',
  builder: (context) => const SplashScreen(),
);