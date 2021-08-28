import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/auth_repository.dart';
import 'package:quiz_app/bloc/login_screen/login_bloc.dart';
import 'package:quiz_app/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:quiz_app/theme/theme.dart';
import 'package:quiz_app/ui/onboarding_screen.dart';
import 'package:quiz_app/ui/profile_setUp.dart';
import 'package:quiz_app/ui/signIn_signUp.dart';
import 'package:quiz_app/ui/splash_screen.dart';

void main() {
  runApp(MyProject());
}

class MyProject extends StatelessWidget {
  const MyProject({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashScreenBloc()..add(NavigateToHomeScreenEvent()),
        ),
        BlocProvider(create: (_) => LoginBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RepositoryProvider(
            create: (context) => AuthRepository(), child: OnboardingScreen()),
        theme: CizoThemes.mainTheme(),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          SignIn_SignUp.routeName: (context) => const SignIn_SignUp(),
          ProfileSetUp.routeName: (context) => const ProfileSetUp(),
        },
      ),
    );
  }
}
