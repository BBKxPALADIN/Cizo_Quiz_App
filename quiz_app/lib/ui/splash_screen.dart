import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:quiz_app/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    this._dispatchEvent(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/icons/logo.png'),
            Text(
              'Interactive Quiz',
              style: CizoThemes.textTheme700.headline2,
            ),
            Text(
              '100% free only at Cizo',
              style: CizoThemes.textTheme400.headline2,
            ),
          ],
        ),
      ),
    );
  }

  void _dispatchEvent(BuildContext context) {
    BlocProvider.of<SplashScreenBloc>(context).add(
      NavigateToHomeScreenEvent(),
    );
  }
}
