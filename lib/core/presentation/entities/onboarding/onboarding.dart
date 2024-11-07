import 'dart:ui';

import '../../../utils/string.dart';
import '../../../constants/app.dart';

class OnboardingContent {
  String image;
  String title;
  String description;
  Color backgroundColor;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

// created onboarding list
List<OnboardingContent> onboardingList = [
  OnboardingContent(
    image: "assets/onboarding/welcome.png",
    title: "Welcome to ${APP_NAME.toCapitalized()}",
    description: '''
Get the right service at your fingertips. Whether you need a quick delivery or 
a hand with moving, we’ve got you covered! For packages, goods, or relocation,
choose from motorbike, truck, or mover services. And stay tuned—more services
are coming soon!
''',
    backgroundColor: const Color(0xFFDEE2E6),
  ),
  OnboardingContent(
    image: "assets/onboarding/delivery_motorbike.png",
    title: "Quick Delivery for Small Packages",
    description: '''
Need to send something small across town, fast? Our motorbike delivery is
perfect for documents, clothes, food, and other small packages. Reliable, quick,
and handled with care.
''',
    backgroundColor: const Color(0xFFFED7EA),
  ),
  OnboardingContent(
    image: "assets/onboarding/delivery_truck.png",
    title: "Heavy-Duty Delivery for Larger Items",
    description: '''
Moving big items? Use our truck delivery to send large items like fridges,
furniture, and other bulky goods. Safe and reliable, for your larger delivery
needs.
''',
    backgroundColor: const Color(0xFFCA9FB4),
  ),
  OnboardingContent(
    image: "assets/onboarding/mover_truck.png",
    title: "Mover and Relocation Service",
    description: '''
Relocating? Leave the heavy lifting to us! Our mover service handles your 
furniture and belongings with care, making your relocation smooth and 
stress-free. Move with ease!
''',
    backgroundColor: const Color(0xFFB6EAFA),
  ),
];
