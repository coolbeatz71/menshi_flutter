import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../constants/app.dart';
import '../../entities/onboarding/onboarding.dart';
import '../../screens/auth/signup/auth.signup.screen.dart';
import '../../widgets/onboarding/onboarding.decoration.widget.dart';
import '../shared/animations/fade.animation.dart';
import '../shared/animations/fade.route.transition.dart';
import '../shared/buttons/solid.button.dart';

class OnboardingContainer extends StatefulWidget {
  const OnboardingContainer({super.key});

  @override
  State<OnboardingContainer> createState() => _OnboardingContainerState();
}

class _OnboardingContainerState extends State<OnboardingContainer> {
  int currentIndex = 0;
  PageController? _controller;
  Color textColor = AppColors.backgroundDark;
  double percentage = ONBOARDING_PERCENTAGE_INCREMENT;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller!.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _controller!.removeListener(_onPageChanged);
    _controller!.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      currentIndex = _controller!.page!.round();
      percentage = (currentIndex + 1) / onboardingContentList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.75),
      body: SafeArea(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: DecorationOnboarding(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                          percentage = (index + 1) / onboardingContentList.length;
                        });
                      },
                      itemCount: onboardingContentList.length,
                      itemBuilder: (BuildContext context, int index) {
                        precacheImage(
                          AssetImage(
                            onboardingContentList[index].image,
                          ),
                          context,
                        );

                        final screenSize = MediaQuery.of(context).size;
                        final imageWidth = screenSize.width * 0.65;
                        final imageHeight = screenSize.height * 0.45;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 20.0,
                              runSpacing: 20.0,
                              children: [
                                // image
                                Image.asset(
                                  onboardingContentList[index].image,
                                  width: imageWidth,
                                  height: imageHeight,
                                ),
                                // title
                                FadeAnimation(
                                  delay: 1.0,
                                  reverse: true,
                                  child: Text(
                                    onboardingContentList[index].title,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: textColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),

                                // description
                                FadeAnimation(
                                  delay: 0.65,
                                  child: Text(
                                    onboardingContentList[index].description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: textColor.withOpacity(0.65),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // navigation dots
                  SizedBox(
                    height: 18.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        onboardingContentList.length,
                        (int index) => AnimatedContainer(
                          height: 9.0,
                          width: currentIndex == index ? 18.0 : 9.0,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 800),
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: (index == currentIndex)
                                ? AppColors.backgroundDark
                                : AppColors.backgroundDark.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // skip and next buttons
                  currentIndex == onboardingContentList.length - 1
                      ? FadeAnimation(
                          reverse: true,
                          child: SolidButton(
                            size: "sm",
                            text: "Get Started",
                            onPressed: () {
                              Navigator.push(
                                context,
                                FadeRouteTransition(
                                  screen: const AuthSignUpScreen(),
                                ),
                              );
                            },
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoButton(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 12.0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  FadeRouteTransition(
                                    screen: const AuthSignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Skip',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: textColor.withOpacity(0.75),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            CupertinoButton(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 12.0,
                              ),
                              onPressed: () {
                                if (currentIndex < onboardingContentList.length - 1) {
                                  _controller!.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  // Handle finish action
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 50.0,
                                    width: 50.0,
                                    child: CircularProgressIndicator(
                                      value: percentage,
                                      backgroundColor: AppColors.primary.withOpacity(0.2),
                                      valueColor: const AlwaysStoppedAnimation<Color>(
                                        AppColors.primary,
                                      ),
                                    ),
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: AppColors.primary,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
