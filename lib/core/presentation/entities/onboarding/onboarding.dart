import '../../../utils/string.dart';
import '../../../constants/app.dart';

class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

// created onboarding list
List<OnboardingContent> onboardingContentList = [
  OnboardingContent(
    image: "assets/onboarding/welcome.png",
    title: "Welcome to ${APP_NAME.toCapitalized()}",
    description: '''
Get the right service at your fingertips. Whether you need a quick delivery or 
a hand with moving, we’ve got you covered! For packages, goods, or relocation,
choose from motorbike, truck, or mover services. And stay tuned—more services
are coming soon!
''',
  ),
  OnboardingContent(
    image: "assets/onboarding/delivery_motorbike.png",
    title: "Quick Delivery for Small Packages",
    description: '''
Need to send a small item across town, fast? Our motorbike delivery is
perfect for documents, clothes, food, and other small packages. Reliable, quick,
and handled with care.
''',
  ),
  OnboardingContent(
    image: "assets/onboarding/delivery_truck.png",
    title: "Heavy-Duty Delivery for Larger Items",
    description: '''
Moving big items? Use our truck delivery to send large items like fridges,
furniture, and other bulky goods. Safe and reliable, for your larger delivery
needs.
''',
  ),
  OnboardingContent(
    image: "assets/onboarding/mover_truck.png",
    title: "Mover and Relocation Service",
    description: '''
Relocating? Leave the heavy lifting to us! Our mover service handles your 
furniture and belongings with care, making your relocation smooth and 
stress-free. Move with ease!
''',
  ),
];
