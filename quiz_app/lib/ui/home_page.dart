import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/theme/color.dart';
import 'package:quiz_app/ui/home/home_screen.dart';
import 'package:quiz_app/ui/home/profile_screen.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  bool isHome = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isHome ? HomeScreen() : ProfileScreen(),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: CizoColors.whiteColor,
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/home.svg',
                          color: isHome
                              ? CizoColors.primaryColor
                              : CizoColors.greyColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/profile.svg',
                          color: !isHome
                              ? CizoColors.primaryColor
                              : CizoColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.2,
                    child: InkWell(
                      onTap: ()async{},
                      child: ,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
