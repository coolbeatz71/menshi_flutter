import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menshi/core/utils/colors.dart';

import '../../../constants/app.dart';
import '../../entities/onboarding/onboarding.dart';
import '../../widgets/onboarding/onboarding.decoration.widget.dart';
import '../shared/animations/fade.animation.dart';

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
      backgroundColor:
          onboardingContentList[currentIndex].backgroundColor.withOpacity(0.75),
      body: SafeArea(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: DecorationOnboarding(),
              ),
            ),
            Column(
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
                      final screenSize = MediaQuery.of(context).size;
                      final imageWidth = screenSize.width * 0.9;
                      final imageHeight = screenSize.height * 0.45;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: textColor.withOpacity(0.65),
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // navigation dots
                SizedBox(
                  height: 12.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingContentList.length,
                      (int index) => AnimatedContainer(
                        height: 12.0,
                        width: currentIndex == index ? 24.0 : 12.0,
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 800),
                        margin: const EdgeInsets.only(right: 4.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                  child: currentIndex == onboardingContentList.length - 1
                      ? FadeAnimation(
                          reverse: true,
                          child: CupertinoButton(
                            onPressed: () {
                              // Handle finish action
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                'Get Started',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle skip action
                              },
                              child: Text(
                                'Skip',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: textColor.withOpacity(0.75),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                if (currentIndex <
                                    onboardingContentList.length - 1) {
                                  _controller!.nextPage(
                                    duration: const Duration(milliseconds: 800),
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
                                    height: 60.0,
                                    width: 60.0,
                                    child: CircularProgressIndicator(
                                      value: percentage,
                                      backgroundColor:
                                          AppColors.primary.withOpacity(0.2),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        AppColors.primary,
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: AppColors.primary,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: onboardingContentList[currentIndex]
                                          .backgroundColor,
                                    ),
                                  ),
                                ],
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
    );
  }
}
