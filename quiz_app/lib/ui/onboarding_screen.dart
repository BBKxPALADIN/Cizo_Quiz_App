import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:quiz_app/data/onboarding.dart';
import 'package:quiz_app/theme/color.dart';
import 'package:quiz_app/theme/theme.dart';
import 'package:quiz_app/ui/signIn_signUp.dart';
import 'package:quiz_app/ui/splash_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentIndex = 0;

  // ignore: deprecated_member_use
  List<Onboarding> slides = new List<Onboarding>();

  @override
  void initState() {
    super.initState();
    slides = getOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashScreenBloc, SplashScreenState>(
        builder: (context, state) {
          if ((state is SplashScreenInitial) ||
              (state is SplashScreenLoading)) {
            return SplashScreen();
          } else if (state is SplashScreenLoaded) {
            return PageView.builder(
              controller: controller,
              itemCount: slides.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (ctx, index) {
                return Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: MediaQuery.of(context).size.width * 0.1,
                      child: Image.asset('assets/icons/back_image.png'),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width *
                          (currentIndex == 1 ? 0.08 : 0.18),
                      child: slides[currentIndex].getImage(),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: CizoColors.whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 15,
                                  ),
                                  child: Text(
                                    slides[currentIndex].getTitle(),
                                    style: CizoThemes.textTheme700.headline2,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    slides[currentIndex].getDesc(),
                                    style: CizoThemes.textTheme400.headline2
                                        .copyWith(
                                            color: CizoColors.darkColor
                                                .withOpacity(0.6)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                            SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              effect: WormEffect(
                                dotColor:
                                    CizoColors.greyColor.withOpacity(0.45),
                                activeDotColor: CizoColors.primaryColor,
                                dotWidth: 10,
                                dotHeight: 10,
                              ),
                            ),
                            // ignore: deprecated_member_use
                            FlatButton(
                              onPressed: () {
                                if (currentIndex != 2) {
                                  setState(() {
                                    controller.animateToPage(currentIndex + 1,
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.linear);
                                  });
                                } else {
                                  Navigator.of(context)
                                      .pushReplacementNamed(SignIn_SignUp.routeName);
                                }
                              },
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                slides[currentIndex].getBtnText(),
                                style:
                                    CizoThemes.textTheme700.headline4.copyWith(
                                  color: CizoColors.whiteColor,
                                ),
                              ),
                              minWidth: MediaQuery.of(context).size.width * 0.9,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              color: CizoColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
