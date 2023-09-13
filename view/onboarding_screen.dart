import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organiser/constants/controllers.dart';
import 'package:organiser/controllers/auth_controller.dart';
import 'package:organiser/helper/custom_button.dart';
import 'package:organiser/view/screens/AuthScreen/auth_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                "Welcome to EBEFA",
                style: themeController.theme.textTheme.displayLarge,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                "Online Ticketing App",
                style: themeController.theme.textTheme.bodyLarge,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Image.asset('assets/onboardIcon.png'),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Expanded(
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: themeController.theme.appBarTheme.backgroundColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.05),
                      topRight: Radius.circular(screenWidth * 0.05),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.022),
                        child: Text(
                          "The Social media platform designed to get you offline",
                          style: themeController.theme.textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.022),
                        child: Text(
                          "EBEFA offers an engaging platform where users can harness the power of their social network to effortlessly craft, explore, and uncover events ",
                          style: themeController.theme.textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      CustomButton(
                        text: "Get Started",
                        onTap: () {
                          Get.off(
                            () => const AuthScreen(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
