import 'package:flutter/material.dart';

void main(){
  runApp(MyProject());
}

class MyProject extends StatelessWidget {
  const MyProject({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
