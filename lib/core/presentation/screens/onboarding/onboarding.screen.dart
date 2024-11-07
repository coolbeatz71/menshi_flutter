import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menshi/core/utils/colors.dart';

import '../../../constants/app.dart';
import '../../entities/onboarding/onboarding.dart';
import '../../widgets/onboarding/onboarding.decoration.widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController? _controller;
  double percentage = ONBOARDING_PERCENTAGE_INCREMENT;
  Color textColor = AppColors.backgroundDark;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onboardingContentList[currentIndex].backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingContentList.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                    percentage += (index >= currentIndex)
                        ? ONBOARDING_PERCENTAGE_INCREMENT
                        : -ONBOARDING_PERCENTAGE_INCREMENT;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runSpacing: 20.0,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const DecorationOnboarding(),
                                  Image.asset(
                                    onboardingContentList[index].image,
                                  ),
                                ],
                              ),
                              // title
                              Text(
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

                              // description
                              Text(
                                onboardingContentList[index].description,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: textColor.withOpacity(0.75),
                                      fontWeight: FontWeight.w500,
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
                horizontal: 12.0,
                vertical: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle skip action
                    },
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: textColor.withOpacity(0.75),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      if (currentIndex < onboardingContentList.length - 1) {
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
                            backgroundColor: AppColors.primary.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation<Color>(
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
      ),
    );
  }
}
