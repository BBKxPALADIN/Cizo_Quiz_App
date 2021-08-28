import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/login_screen/login_bloc.dart';
import 'package:quiz_app/theme/color.dart';
import 'package:quiz_app/theme/theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _keyForm = GlobalKey<FormState>();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool _isVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    emailController.clear();
    passwordController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
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
                      'E-Mail Address',
                      style: CizoThemes.textTheme400.headline4.copyWith(
                        color: CizoColors.darkColor.withOpacity(0.8),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    onChanged: (email) => context
                        .read<LoginBloc>()
                        .add(LoginUserEmailChanged(userEmail: email)),
                    validator: (value) {
                      if (state.isValidEmail == 1) {
                        return 'Please write your email address';
                      } else if (state.isValidEmail == 2) {
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
                        color: state.isValidEmail == null
                            ? CizoColors.primaryColor
                            : CizoColors.greyColor,
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
                      fillColor: state.isValidEmail == null &&
                              emailController.text == ''
                          ? CizoColors.whiteColor
                          : CizoColors.greyColor.withOpacity(0.1),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
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
                    onChanged: (password) => context
                        .read<LoginBloc>()
                        .add(LoginPasswordChanged(password: password)),
                    validator: (value) {
                      if (state.isValidPassword == 1) {
                        return 'Please enter a password!!!';
                      } else if (state.isValidPassword == 2) {
                        return 'Password is too short!!!';
                      } else {
                        isPasswordValid = true;
                        return null;
                      }
                    },
                    cursorColor: CizoColors.greyColor,
                    obscureText: !_isVisible,
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
                        color: state.isValidPassword == null
                            ? CizoColors.primaryColor
                            : CizoColors.greyColor,
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
                      fillColor: state.isValidPassword == null &&
                              passwordController.text == ''
                          ? CizoColors.whiteColor
                          : CizoColors.greyColor.withOpacity(0.1),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    if (_keyForm.currentState.validate()) {
                      context.read<LoginBloc>().add(LoginSubmitted());
                    }
                  },
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Login',
                    style: CizoThemes.textTheme700.headline4.copyWith(
                      color: state.isValidPassword == null &&
                              state.isValidEmail == null
                          ? CizoColors.whiteColor
                          : CizoColors.greyColor,
                    ),
                  ),
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                    side: state.isValidPassword == null &&
                            state.isValidEmail == null
                        ? BorderSide.none
                        : BorderSide(
                            width: 1.7,
                            color: CizoColors.greyColor,
                          ),
                  ),
                  color: state.isValidPassword == null &&
                          state.isValidEmail == null
                      ? CizoColors.primaryColor
                      : CizoColors.whiteColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
