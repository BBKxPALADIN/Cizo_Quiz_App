import 'package:flutter/material.dart';
import 'package:quiz_app/models/signIn.dart';
import 'package:quiz_app/models/signUp.dart';
import 'package:quiz_app/theme/color.dart';
import 'package:quiz_app/theme/theme.dart';
import 'package:toggle_bar/toggle_bar.dart';

// ignore: camel_case_types
class SignIn_SignUp extends StatefulWidget {
  static const routeName = '/signup';

  const SignIn_SignUp({Key key}) : super(key: key);

  @override
  _SignIn_SignUpState createState() => _SignIn_SignUpState();
}

// ignore: camel_case_types
class _SignIn_SignUpState extends State<SignIn_SignUp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Image.asset(
            'assets/icons/back_image.png',
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.82,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CizoColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  SizedBox(
                    height: 75,
                    child: ToggleBar(
                      labels: ['Login', 'Sign Up'],
                      textColor: CizoColors.primaryColor,
                      selectedTextColor: CizoColors.whiteColor,
                      backgroundColor: CizoColors.primaryColor.withOpacity(0.1),
                      selectedTabColor: CizoColors.primaryColor,
                      labelTextStyle: CizoThemes.textTheme700.headline3,
                      onSelectionUpdated: (index) {
                        setState(() {
                          counter = index;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: counter == 1 ? SignUp() : SignIn(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.65,
            left: MediaQuery.of(context).size.width * 0.18,
            child: Image.asset('assets/icons/handshake.png'),
          ),
        ],
      ),
    );
  }
}
