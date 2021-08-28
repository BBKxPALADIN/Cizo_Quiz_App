import 'package:flutter/material.dart';
import 'package:quiz_app/theme/color.dart';
import 'package:quiz_app/theme/theme.dart';
import 'package:quiz_app/ui/profile_setUp.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _keyForm = GlobalKey<FormState>();
  bool isNameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool _isVisible = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool isValid() {
    return isNameValid && isEmailValid && isPasswordValid;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  'Full Name',
                  style: CizoThemes.textTheme400.headline4.copyWith(
                    color: CizoColors.darkColor.withOpacity(0.8),
                  ),
                ),
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == '') {
                    return 'Please write your full name';
                  } else if (value.length < 5) {
                    return 'Full Name be less than 6 characters!!!';
                  } else {
                    isNameValid = true;
                    return null;
                  }
                },
                cursorColor: CizoColors.greyColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: nameController.text == ''
                        ? CizoColors.greyColor
                        : CizoColors.primaryColor,
                  ),
                  hintText: 'Enter your full name',
                  hintStyle: CizoThemes.textTheme400.headline4
                      .copyWith(color: CizoColors.greyColor),
                  focusColor: CizoColors.greyColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: CizoColors.primaryColor,
                      width: 1.7,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: CizoColors.errorColor,
                      width: 1.7,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: nameController.text == ''
                          ? Colors.transparent
                          : CizoColors.primaryColor,
                      width: 1.7,
                    ),
                  ),
                  fillColor: nameController.text == ''
                      ? CizoColors.greyColor.withOpacity(0.1)
                      : CizoColors.whiteColor,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  'E-Mail Address',
                  style: CizoThemes.textTheme400.headline4.copyWith(
                    color: CizoColors.darkColor.withOpacity(0.8),
                  ),
                ),
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == '') {
                    return 'Please write your email address';
                  } else if (!value.contains('@') && value.length < 6) {
                    return 'Email Address be less than 6 characters!!!';
                  } else {
                    isEmailValid = true;
                    return null;
                  }
                },
                cursorColor: CizoColors.greyColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: emailController.text == ''
                        ? CizoColors.greyColor
                        : CizoColors.primaryColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: CizoColors.primaryColor,
                      width: 1.7,
                    ),
                  ),
                  hintText: 'Enter your e-mail address',
                  hintStyle: CizoThemes.textTheme400.headline4
                      .copyWith(color: CizoColors.greyColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: CizoColors.errorColor,
                      width: 1.7,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: emailController.text == ''
                          ? Colors.transparent
                          : CizoColors.primaryColor,
                      width: 1.7,
                    ),
                  ),
                  fillColor: emailController.text == ''
                      ? CizoColors.greyColor.withOpacity(0.1)
                      : CizoColors.whiteColor,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  'Password',
                  style: CizoThemes.textTheme400.headline4.copyWith(
                    color: CizoColors.darkColor.withOpacity(0.8),
                  ),
                ),
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == '') {
                    return 'Please enter a password!!!';
                  } else if (value.length < 5) {
                    return 'Password is too short!!!';
                  } else {
                    isPasswordValid = true;
                    return null;
                  }
                },
                obscureText: !_isVisible,
                cursorColor: CizoColors.greyColor,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off,
                      color: CizoColors.greyColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: passwordController.text == ''
                        ? CizoColors.greyColor
                        : CizoColors.primaryColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: CizoColors.primaryColor,
                      width: 1.7,
                    ),
                  ),
                  hintText: 'Create account password',
                  hintStyle: CizoThemes.textTheme400.headline4
                      .copyWith(color: CizoColors.greyColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: CizoColors.errorColor,
                      width: 1.7,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: passwordController.text == ''
                          ? Colors.transparent
                          : CizoColors.primaryColor,
                      width: 1.7,
                    ),
                  ),
                  fillColor: passwordController.text == ''
                      ? CizoColors.greyColor.withOpacity(0.1)
                      : CizoColors.whiteColor,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProfileSetUp.routeName);
              },
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Sign Up',
                style: CizoThemes.textTheme700.headline4.copyWith(
                  color:
                      isValid() ? CizoColors.whiteColor : CizoColors.greyColor,
                ),
              ),
              minWidth: MediaQuery.of(context).size.width * 0.9,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: isValid()
                    ? BorderSide.none
                    : BorderSide(
                        width: 1.7,
                        color: CizoColors.greyColor,
                      ),
              ),
              color:
                  isValid() ? CizoColors.primaryColor : CizoColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
